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
        
        
        recipes.append(Recipe(Name: "Roasted Potatoes", Instructions: "Preheat oven to 40 degree F. Cut the potatoes into half or quaters and place in the bowl with olive oil, salt, pepper and garlic. Toss until the potatoes are well coated. Transfer the potatoes to a sheet pan and spread out into 1 layer. Roast in the oven for 45 minutes or until brown and crisp. Flip twice with a spatula during cooking in order to ensure even browning. Remove the potatoes from the oven, toss with parsley, season to taste, and serve hot.", Ingredients: ["3 lbs small red or white potatoes", "1/4 cup good olive oil", "1 1/2 teaspoons kosher salt", "1 teaspoon freshly ground black pepper", "2 tablespoons minced garlic (6 catloves)", "2 tablespoons minced fresh parsley"], Image: UIImage(named: "roastedPotatoes")!))
        
        recipes.append(Recipe(Name: "Salmon roasted in butter", Instructions: "Preheat the oven to 475 degrees. Place the butter and half the herb in a roasting pan just large enough to fit the salmon and place it in the oven. Heat about 5 minutes, until the butter melts and the herb begins to sizzle. Add the salmon to the pan, skin side up. Roast 4 minutes. Remove from the oven, then peel the skin off. (If the skin does not lift right off, cook 2 minutes longer.) Sprinkle with salt and pepper and turn the fillet over. Sprinkle with salt and pepper again. Roast 3 to 5 minutes more, depending on the thickness of the fillet and the degree of doneness you prefer. Cut into serving portions, spoon a little of the butter over each and garnish with the remaining herb. Serve with lemon wedges.", Ingredients: ["4 tbsp (1/2 stick) butter","4 tbsp minced chervil, parsley or dill", "1 salmon fillet, 1 1/2 to 2 lbs", "Salt and freshly ground black pepper to taste", "Lemon wedges"], Image: UIImage(named: "salmon")!))
        
        recipes.append(Recipe(Name: "Basic french omelet", Instructions: "Beat eggs, water, salt and pepper in small bowl until blended. Heat butter in 6 to 8-inch nonstick omelet pan or skillet over medium-high heat until hot. Tilt pan to coat bottom. Pour in egg mixture. Mixture should set immediately at edges. Gently Push cooked portions from edges toward the center with inverted turner so that uncooked eggs can reach the hot pan surface. Countinue cooking, tilting pan and gently moving cooked portions as needed. When top surface of eggs is thickened and no visible liquid egg remains, placefilling on one side of the omelet. Fold omelet in half with turner. With a quick flip of the wrist, turn pan and invert or slide omelet onto plate. serve immediately.", Ingredients: ["2 eggs","2 tbsp water", "1/8 tsp salt", "a dash of pepper", "1 tsp butter", "1/3 cup filling, such as shredded cheese, finely chopped ham"], Image: UIImage(named: "omlete")!))
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailDiscoverVC = segue.destinationViewController as! DetailDiscoverVC
        let selectedRow = tableView.indexPathForSelectedRow?.row
        
        detailDiscoverVC.recipes = recipes[selectedRow!]
    }
    
    
}


