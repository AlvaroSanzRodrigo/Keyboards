//
//  KeyboardsViewController.swift
//  Keyboards
//
//  Created by Álvaro Sanz Rodrigo on 17/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit


class KeyboardsViewController: UIViewController {
    
    internal var section1: [FirstSection] = []
    internal var section2: [FirstSection] = []
    internal var section3: [AllKeyboardsSection] = []
    internal var section4: [AllKeyboardsSection] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCells()
        registerCells()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCells() {
        let withSwitchTableViewCellNib = UINib(nibName: "WithSwitchTableViewCell", bundle: nil)
        tableView.register(withSwitchTableViewCellNib, forCellReuseIdentifier: "withSwitchTableViewCell")
        let withArrowTableViewCellNib = UINib(nibName: "WithArrowTableViewCell", bundle: nil)
        tableView.register(withArrowTableViewCellNib, forCellReuseIdentifier: "withArrowTableViewCell")
    }
    
    func loadCells() {
        let s1c1 = FirstSection(name: "Keyboards", number: "3")
        let s1c2 = FirstSection(name: "Hardware Keyboards", number: "")
        section1.append(s1c1)
        section1.append(s1c2)
        let s2c1 = FirstSection(name: "Text Replacement", number: "")
        let s2c2 = FirstSection(name: "One Handed Keyboard", number: "Off")
        section2.append(s2c1)
        section2.append(s2c2)
        let s3c1 = AllKeyboardsSection(name: "Auto-Capitalization")
        let s3c2 = AllKeyboardsSection(name: "Auto-Correction")
        let s3c3 = AllKeyboardsSection(name: "Check Spelling")
        let s3c4 = AllKeyboardsSection(name: "Eneable Caps Lock")
        let s3c5 = AllKeyboardsSection(name: "Predictive")
        let s3c6 = AllKeyboardsSection(name: "Smart Punctuation")
        let s3c7 = AllKeyboardsSection(name: "Character Preview")
        let s3c8 = AllKeyboardsSection(name: "'.' Shortcut")
        section3.append(s3c1)
        section3.append(s3c2)
        section3.append(s3c3)
        section3.append(s3c4)
        section3.append(s3c5)
        section3.append(s3c6)
        section3.append(s3c7)
        section3.append(s3c8)
        let s4c1 = AllKeyboardsSection(name: "Eneable Dictation")
        section4.append(s4c1)
    }

}

extension KeyboardsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titleForSection: String = ""
        switch section {
            case 2:
            titleForSection = "all keyboards"
            case 3:
            titleForSection = "dictation"
            default:
            titleForSection = ""
        }
        return titleForSection
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section==2 {
            return "Double tapping the space bar will insert a period followed by a space"
        }else{
        return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsInSection = 0
        switch section{
        case 0:
            rowsInSection = section1.count
        case 1:
            rowsInSection = section2.count
        case 2:
            rowsInSection = section3.count
        case 3:
            rowsInSection = section4.count
        default:
            rowsInSection = 0
        }
        return rowsInSection
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print(section1[indexPath.row].name!)
            case 1:
            print(section2[indexPath.row].name!)
        case 2:
            print(section3[indexPath.row].name!)
        case 3:
            print(section4[indexPath.row].name!)
        default:
            print("Esto no deberia de pasar")
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let withArrowTableViewCell:WithArrowTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "withArrowTableViewCell", for: indexPath) as? WithArrowTableViewCell)!
        
        let withSwitchTableView:WithSwitchTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "withSwitchTableViewCell", for: indexPath) as? WithSwitchTableViewCell)!
        withSwitchTableView.delegate = self
        
        switch indexPath.section {
        case 0:
            withArrowTableViewCell.lblName.text = section1[indexPath.row].name
            withArrowTableViewCell.lblNumber.text = section1[indexPath.row].number
            return withArrowTableViewCell
        case 1:
            withArrowTableViewCell.lblName.text = section2[indexPath.row].name
            withArrowTableViewCell.lblNumber.text = section2[indexPath.row].number
            return withArrowTableViewCell
        case 2:
            withSwitchTableView.lblName.text = section3[indexPath.row].name
            return withSwitchTableView
        case 3:
            withSwitchTableView.lblName.text = section4[indexPath.row].name
            return withSwitchTableView
        default:
            withSwitchTableView.lblName.text = "Esto no deberia de salir"
            return withSwitchTableView
        }
        
        
    }
}
    
extension KeyboardsViewController: SwitchChangedDelegate {
    func switchCangedAction(switchState: Bool) {
        if switchState {
            print("On")
            
        }else {
            print("Off")
        }
    }
    
        
    
}

