//
//  CustomCell.swift
//  MealManager1
//
//  Created by Student on 5/3/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell
{
    
    @IBOutlet weak var name: UITextView!
    @IBOutlet var photo: UIImageView!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    
}
