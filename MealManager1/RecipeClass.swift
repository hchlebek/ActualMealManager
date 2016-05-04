//
//  RecipeClass.swift
//  MealManager1
//
//  Created by Student on 5/2/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class Recipe : NSObject
{
    var name = ""
    var instructions = ""
    var ingredientsArray = [String]()
    var image = UIImage(named: "default")
    
    init (Name: String, Image: UIImage)
    {
        super.init()
        name = Name
        image = Image
    }
    
    init(Name: String, Instructions: String, Ingredients: [String], Image: UIImage)
    {
        super.init()
        name = Name
        instructions = Instructions
        ingredientsArray = Ingredients
        image = Image
        
    }
}
