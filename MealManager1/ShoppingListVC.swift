//
//  ShoppingListVC.swift
//  MealManager1
//
//  Created by HChlebek on 5/1/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet var listTableView: UITableView!
    
    var listArray : [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        listTableView.delegate = self
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add item?", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let myRecipeTextField = myAlert.textFields! [0] as UITextField
            self.listArray.append(myRecipeTextField.text!)
            self.listTableView.reloadData()
            
        }
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler { (myRecipeTextField) -> Void in
            myRecipeTextField.placeholder = "Add an item"
        }
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        listTableView.editing = !listTableView.editing
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let listTableViewCell = listTableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath)
        listTableViewCell.textLabel?.text = listArray[indexPath.row]
        
        return listTableViewCell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            listArray.removeAtIndex(indexPath.row)
            
            listTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let items = listArray[sourceIndexPath.row]
        listArray.removeAtIndex(sourceIndexPath.row)
        listArray.insert(items, atIndex: destinationIndexPath.row)
    }
    
    
}


