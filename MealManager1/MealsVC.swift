//
//  MealsVC.swift
//  MealManager1
//
//  Created by Student on 5/15/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class MealsVC: UITableViewController
{
    
    @IBOutlet var mealsOfTheDay: UITableView!
    
    var mealsArray = ["Breakfast", "Lunch", "Snacks", "Dinner"]
    var dayChosen : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mealsOfTheDay.dataSource = self
        mealsOfTheDay.delegate = self
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mealsArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = mealsOfTheDay.dequeueReusableCellWithIdentifier("mealsCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = mealsArray[indexPath.row]
        return myTableViewCell
    }
    

    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    //{
        //let plannedVC = segue.destinationViewController as! plannedRecipesVC
        //plannedVC.dayChosen2 = dayChosen
   // }

}
