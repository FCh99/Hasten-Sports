//
//  DetailViewController.swift
//  Hasten Sports
//
//  Created by Fausto Checa on 12/7/18.
//  Copyright © 2018 Fausto Checa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var name = ""
    var surname = ""
    var imageString = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        surnameLabel.text = surname
        print(">>>>>>>>>>")
        print(imageString)
        
        myImageView.image = UIImage(named: imageString)

        UIView.animate(withDuration: 0.5) { () -> Void in
            self.surnameLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.45, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            self.surnameLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
            self.surnameLabel.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
        
        
        
    }

    
   

}
