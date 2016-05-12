//
//  MyRecipesVC.swift
//  MealManager1
//
//  Created by HChlebek on 5/1/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class MyRecipesVC: UIViewController
{
    @IBOutlet var myRecipesTableView: UITableView!
    var recipes : [Recipe] = []
    var data : Recipe!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Recipe?", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let myRecipeTextField = myAlert.textFields! [0] as UITextField
            self.recipes.append(Recipe(Name: myRecipeTextField.text!, Image: UIImage(named: "default")!))
            self.myRecipesTableView.reloadData()
            
    }
    
    
    
    }
}