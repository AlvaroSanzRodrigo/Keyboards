//
//  WithArrowTableViewCell.swift
//  Keyboards
//
//  Created by Álvaro Sanz Rodrigo on 23/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class WithArrowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
