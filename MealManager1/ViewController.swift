//
//  ViewController.swift
//  MealManager1
//
//  Created by HChlebek on 5/1/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet var calendarTableView: UITableView!
    
    var daysArray = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        calendarTableView.dataSource = self
        calendarTableView.delegate = self

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return daysArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = calendarTableView.dequeueReusableCellWithIdentifier("calendarCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = daysArray[indexPath.row]
        return myTableViewCell
    }
    
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    //{
      //  let plannedRecipesVC = segue.destinationViewController as! PlannedRecipesVC
        //let selectedRow = calendarTableView.indexPathForSelectedRow?.row
        //plannedRecipesVC.dayChosen = daysArray[selectedRow!]
    //}



}

