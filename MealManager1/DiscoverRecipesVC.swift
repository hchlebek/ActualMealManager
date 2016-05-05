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
    
    var recipes : [Recipe] = []
    var namesOfFood = ["food"]
    var images = [UIImage(named: "default")]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        recipes.append(Recipe(Name: "Cherry Tomato and Basil Angel Hair Pasta", Instructions: "bring a large pot of water to a rolling boil. add in a good handful of salt. add pasta. cook aldente or until pasta is slightly undercooked. using tongs remove pasta from water into a colander. reserve cooking liquid.  while pasta is cooking, add garlic and olive oil to a very large skillet. turn the heat on medium and cook until garlic becomes soft, about two minutes.  turn the heat to a medium-high and add tomatoes and salt. cook two minutes.  add 1/2 cup of starchy cooking liquid leftover from pasta. bring the mixture to a boil and reduce to a simmer for five minutes — the tomatoes should be starting to burst. if they haven’t gently push on them using the back of a wooden spoon. you only want about half to burst. add pasta, cook another two minutes.  turn the heat off, add basil and parmesan cheese. toss to coat. if needed add more starchy pasta water.  season to taste with salt and pepper. serve with extra grated parmesan cheese.", Ingredients: ["1/2 lb angel hair paster","2 tbsp olive oil","5 large garlic cloves, thinly sliced","2 lb cherry or grape tomatoes","1 cup loosely packed basil, roughly chopped","3/4 tsp salt","1/2 cup grated parmesan"], Image: UIImage(named: "tomatoBasilPasta")!))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.name.text = recipes[indexPath.row].name
        cell.photo.image = recipes[indexPath.row].image
        
        return cell
    }
    
    
}


