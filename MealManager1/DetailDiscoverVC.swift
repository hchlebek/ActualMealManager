//
//  DetailDiscoverVC.swift
//  MealManager1
//
//  Created by HChlebek on 5/9/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class DetailDiscoverVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var recipes : Recipe!

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTextViewInstructions: UITextView!
    @IBOutlet weak var detailTableViewIngredients: UITableView!
    
    
    @IBOutlet var scrollView: UIScrollView!
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        detailTableViewIngredients.dataSource = self
        detailTableViewIngredients.delegate = self
    
        detailImage.image = recipes.image
        detailTextViewInstructions.text! = recipes.instructions
        
        scrollView.contentSize.height = 1000
      
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipes.ingredientsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.detailTableViewIngredients.dequeueReusableCellWithIdentifier("detailDiscover", forIndexPath: indexPath)
        cell.textLabel?.text = recipes.ingredientsArray[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Recipe to My Recipes?", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil)
        //myAlert.addAction(cancelAction)
        
        //let addAction = UIAlertAction(title: <#T##String?#>, style: <#T##UIAlertActionStyle#>, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
    }
    
    func checkWhichDataToUse()
    {
        if recipes.name == "Roasted Potatoes"
        {
            
        }
        if recipes.name == ""
        {
            
        }
        if recipes.name == ""
        {
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let recipeVC = segue.destinationViewController as! MyRecipesVC
        
        recipeVC.data = recipes
        
    }
}