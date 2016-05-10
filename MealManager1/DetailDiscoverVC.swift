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
    var recipes: Recipe!
    
    @IBOutlet weak var detailScroll: UIScrollView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTextViewInstructions: UITextView!
    @IBOutlet weak var detailTableViewIngredients: UITableView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        detailImage.image = recipes.image
        detailTextViewInstructions.text! = recipes.instructions
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipes.ingredientsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("detailDiscover", forIndexPath: indexPath) as! CustomCell
        
        cell.name.text = recipes[indexPath.row].name
        cell.photo.image = recipes[indexPath.row].image
        
        return cell
    }
    
    
}