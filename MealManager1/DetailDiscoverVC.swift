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
    var newRecipes : [NewRecipe] = []

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
        let cell2 = self.detailTableViewIngredients.dequeueReusableCellWithIdentifier("detailDiscover", forIndexPath: indexPath)
        cell2.textLabel?.text = recipes.ingredientsArray[indexPath.row]
        
        
        cell2.textLabel?.numberOfLines = 0
        
        
        return cell2
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Recipe to My Recipes?", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Yes", style: .Default) { (addAction) in

        }
        
    }
    
    //func checkWhichDataToUse()
    //{
        //if recipes.name == "Roasted Potatoes"
        //{
            
           //newRecipes.append(NewRecipe(Name: "Roasted Potatoes", Instructions: "Preheat oven to 40 degree F. Cut the potatoes into half or quaters and place in the bowl with olive oil, salt, pepper and garlic. Toss until the potatoes are well coated. Transfer the potatoes to a sheet pan and spread out into 1 layer. Roast in the oven for 45 minutes or until brown and crisp. Flip twice with a spatula during cooking in order to ensure even browning. Remove the potatoes from the oven, toss with parsley, season to taste, and serve hot.", Ingredients: ["3 lbs small red or white potatoes", "1/4 cup good olive oil", "1 1/2 teaspoons kosher salt", "1 teaspoon freshly ground black pepper", "2 tablespoons minced garlic (6 catloves)", "2 tablespoons minced fresh parsley"], Image: UIImage(named: "roastedPotatoes")!))
       // }
       // if recipes.name == "Salmon roasted in butter"
       // {
           // newRecipes.append(NewRecipe(Name: "Salmon roasted in butter", Instructions: "Preheat the oven to 475 degrees. Place the butter and half the herb in a roasting pan just large enough to fit the salmon and place it in the oven. Heat about 5 minutes, until the butter melts and the herb begins to sizzle. Add the salmon to the pan, skin side up. Roast 4 minutes. Remove from the oven, then peel the skin off. (If the skin does not lift right off, cook 2 minutes longer.) Sprinkle with salt and pepper and turn the fillet over. Sprinkle with salt and pepper again. Roast 3 to 5 minutes more, depending on the thickness of the fillet and the degree of doneness you prefer. Cut into serving portions, spoon a little of the butter over each and garnish with the remaining herb. Serve with lemon wedges.", Ingredients: ["4 tbsp (1/2 stick) butter","4 tbsp minced chervil, parsley or dill", "1 salmon fillet, 1 1/2 to 2 lbs", "Salt and freshly ground black pepper to taste", "Lemon wedges"], Image: UIImage(named: "salmon")!))
       // }
       // if recipes.name == "Basic french omelet"
       // {
           // newRecipes.append(NewRecipe(Name: "Basic french omelet", Instructions: "Beat eggs, water, salt and pepper in small bowl until blended. Heat butter in 6 to 8-inch nonstick omelet pan or skillet over medium-high heat until hot. Tilt pan to coat bottom. Pour in egg mixture. Mixture should set immediately at edges. Gently Push cooked portions from edges toward the center with inverted turner so that uncooked eggs can reach the hot pan surface. Countinue cooking, tilting pan and gently moving cooked portions as needed. When top surface of eggs is thickened and no visible liquid egg remains, placefilling on one side of the omelet. Fold omelet in half with turner. With a quick flip of the wrist, turn pan and invert or slide omelet onto plate. serve immediately.", Ingredients: ["2 eggs","2 tbsp water", "1/8 tsp salt", "a dash of pepper", "1 tsp butter", "1/3 cup filling, such as shredded cheese, finely chopped ham"], Image: UIImage(named: "omlete")!))
       // }
    //}
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let recipeVC = segue.destinationViewController as! MyRecipesVC
        
        recipeVC.data = recipes
        
        
    }
    
}