//
//  MainViewController.swift
//  Keyboards
//
//  Created by Álvaro Sanz Rodrigo on 17/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var showKeyboardsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "General"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showKeyboardsButtonAction(_ sender: Any) {
        let keyboardsVC = KeyboardsViewController()
        navigationController?.pushViewController(keyboardsVC, animated: true)
    }
}
