//
//  MyTableViewCell.swift
//  Hasten Sports
//
//  Created by Fausto Checa on 12/7/18.
//  Copyright © 2018 Fausto Checa. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
   
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
