//
//  MyRecipesVC.swift
//  MealManager1
//
//  Created by HChlebek on 5/1/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class MyRecipesVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var myRecipesTableView: UITableView!
    var recipes : [Recipe] = []
    var data : Recipe!
    var newRecipe : [NewRecipe] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myRecipesTableView.dataSource = self
        myRecipesTableView.delegate = self
        
    }
    override func viewDidAppear(animated: Bool) {
        myRecipesTableView.reloadData()
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
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler { (myRecipeTextField) -> Void in
            myRecipeTextField.placeholder = "Add a recipe name"
        }
    self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myRecipesTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = recipes[indexPath.row].name
    
        
        return myTableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipes.count
    }
}