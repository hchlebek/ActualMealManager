//
//  DetailMyRecipesVC.swift
//  MealManager1
//
//  Created by HChlebek on 5/11/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class DetailMyRecipesVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var myRecipes : Recipe!
    
    @IBOutlet var myRecipeImageView: UIImageView!
    @IBOutlet var myRecipeInstructions: UITextView!
    @IBOutlet var myRecipeTableView: UITableView!
    
    @IBOutlet var myRecipeScrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myRecipeTableView.dataSource = self
        myRecipeTableView.delegate = self
        
        myRecipeScrollView.contentSize.height = 1000
        
        myRecipeImageView.image = myRecipes.image
        myRecipeInstructions.text = myRecipes.instructions
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myRecipes.ingredientsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell3 = self.myRecipeTableView.dequeueReusableCellWithIdentifier("detailDiscover", forIndexPath: indexPath)
        cell3.textLabel?.text = myRecipes.ingredientsArray[indexPath.row]
        
        
        cell3.textLabel?.numberOfLines = 0
        
        
        return cell3
    }

    
    
    
    
}
