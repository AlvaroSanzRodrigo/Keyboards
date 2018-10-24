//
//  WithSwitchTableViewCell.swift
//  Keyboards
//
//  Created by Álvaro Sanz Rodrigo on 17/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

protocol SwitchChangedDelegate: class {
    func switchCangedAction(switchState: Bool)
}

class WithSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    weak var delegate: SwitchChangedDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        delegate?.switchCangedAction(switchState: sender.isOn)
    }
    
}
