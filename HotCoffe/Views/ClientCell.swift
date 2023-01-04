//
//  ClientCell.swift
//  HotCoffee
//
//  Created by Marco Alonso Rodriguez on 03/01/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import UIKit

class ClientCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
