//
//  NewRecipeClass.swift
//  MealManager1
//
//  Created by HChlebek on 5/13/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class NewRecipe : NSObject
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
