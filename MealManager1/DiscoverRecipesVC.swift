//
//  DiscoverRecipesVC.swift
//  MealManager1
//
//  Created by HChlebek on 5/1/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//  Bhavana 

import UIKit

class DiscoverRecipesVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet var tableView: UITableView!
    
    var namesOfFood = ["food"]
    var images = [UIImage(named: "default")]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return namesOfFood.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.name.text = namesOfFood[indexPath.row]
        cell.photo.image = images[indexPath.row]
        
        return cell
    }
    
    
}


