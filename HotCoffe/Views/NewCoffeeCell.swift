//
//  NewCoffeeCell.swift
//  HotCoffe
//
//  Created by Marco Alonso Rodriguez on 03/01/23.
//

import UIKit

class NewCoffeeCell: UITableViewCell {

    @IBOutlet weak var logoCoffeImage: UIImageView!
    @IBOutlet weak var nameCoffeeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logoCoffeImage.layer.cornerRadius = 25
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
