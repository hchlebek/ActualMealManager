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
        
        // recipes.append(Recipe(Name: data.name, Instructions: data.instructions, Ingredients: data.ingredientsArray, Image: data.image!))
        
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
            self.recipes.append(Recipe(Name: myRecipeTextField.text!, Instructions: "", Ingredients: [], Image: UIImage(named: "default")!))
            self.myRecipesTableView.reloadData()
    
    }
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler { (myRecipeTextField) -> Void in
            myRecipeTextField.placeholder = "Add a recipe name"
        }
    self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        myRecipesTableView.editing = !myRecipesTableView.editing
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
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            recipes.removeAtIndex(indexPath.row)
            
            myRecipesTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let items = recipes[sourceIndexPath.row]
        recipes.removeAtIndex(sourceIndexPath.row)
        recipes.insert(items, atIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailMyRecipesVC = segue.destinationViewController as! DetailMyRecipesVC
        let selectedRow = myRecipesTableView.indexPathForSelectedRow?.row
        detailMyRecipesVC.myRecipes = recipes[selectedRow!]
    }
}