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
        
        recipes.append(Recipe(Name: "Cherry Tomato and Basil Angel Hair Pasta", Instructions: "bring a large pot of water to a rolling boil. add in a good handful of salt. add pasta. cook aldente or until pasta is slightly undercooked. using tongs remove pasta from water into a colander. reserve cooking liquid.  while pasta is cooking, add garlic and olive oil to a very large skillet. turn the heat on medium and cook until garlic becomes soft, about two minutes.  turn the heat to a medium-high and add tomatoes and salt. cook two minutes.  add 1/2 cup of starchy cooking liquid leftover from pasta. bring the mixture to a boil and reduce to a simmer for five minutes — the tomatoes should be starting to burst. if they haven’t gently push on them using the back of a wooden spoon. you only want about half to burst. add pasta, cook another two minutes.  turn the heat off, add basil and parmesan cheese. toss to coat. if needed add more starchy pasta water.  season to taste with salt and pepper. serve with extra grated parmesan cheese.", Ingredients: ["1/2 lb angel hair pasta","2 tbsp olive oil","5 large garlic cloves, thinly sliced","2 lb cherry or grape tomatoes","1 cup loosely packed basil, roughly chopped","3/4 tsp salt","1/2 cup grated parmesan"], Image: UIImage(named: "tomatoBasilPasta")!))
        
        recipes.append((Recipe(Name: "Peanut Butter Blossom Cookies", Instructions: "Heat oven to 375°F.  In large bowl, beat 1/2 cup granulated sugar, the brown sugar, peanut butter, butter and egg with electric mixer on medium speed, or mix with spoon, until well blended.  Stir in flour, baking soda and baking powder until dough forms.  Shape dough into 1-inch balls; roll in additional granulated sugar.  On ungreased cookie sheets, place about 2 inches apart.   Bake 8 to 10 minutes or until edges are light golden brown. Immediately press 1 milk chocolate candy in center of each cookie. Remove from cookie sheets to cooling rack.", Ingredients: ["1/2 cup granulated sugar","1/2 cup packed brown sugar","1/2 cup creamy peanut butter","1/2 cup butter of margarine, softened","1 egg","1 1/2 cups all-purpose flour","3/4 tsp baking soda","1/2 tsp baking powder", "Additional granulated sugar","36 hershey's kisses milk chocolates, unwrapped"], Image: UIImage(named: "peanutbutterCookies")!)))
        
        recipes.append(Recipe(Name: "Fried Rice", Instructions: "Heat wok over high heat. Pour in oil, then stir in carrots and peas; cook about 30 seconds. Crack in eggs, stirring quickly to scramble eggs with vegetables. Stir in cooked rice. Shake in soy sauce, and toss rice to coat. Drizzle with sesame oil, and toss again.", Ingredients: ["2 cups cooked white rice","2/3 cup frozen chopped carrots","1/2 cup frozen green peas","2 tbsps vegetable oil","2 eggs","Soy sauce to taste","Seasame oil to taste (optional)"], Image: UIImage(named: "friedRice")!))
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


