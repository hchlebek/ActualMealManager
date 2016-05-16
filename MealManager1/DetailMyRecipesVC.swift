//
//  DetailMyRecipesVC.swift
//  MealManager1
//
//  Created by HChlebek on 5/11/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class DetailMyRecipesVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    var myRecipes : Recipe!
    
    @IBOutlet var myRecipeImageView: UIImageView!
    @IBOutlet var myRecipeInstructions: UITextView!
    @IBOutlet var myRecipeInstructionsLabel: UILabel!
    @IBOutlet var myRecipeIngredientsLabel: UILabel!
    @IBOutlet var myRecipeEditLabel: UIButton!
    @IBOutlet var myRecipeTableView: UITableView!
    @IBOutlet var myRecipeTextField: UITextField!
    @IBOutlet var myRecipeAddButton: UIButton!
    @IBOutlet var myRecipeSaveButton: UIButton!
    @IBOutlet var myRecipeChangeImage: UIButton!
    let imagePicker = UIImagePickerController()
    
    @IBOutlet var ScrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        myRecipeTableView.dataSource = self
        myRecipeTableView.delegate = self
        
        ScrollView.contentSize.height = 1500
        
        myRecipeImageView.image = myRecipes.image
        myRecipeInstructions.text = myRecipes.instructions
    }
    
    @IBAction func myRecipeImageButtonTapped(sender: UIButton)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true)
        { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myRecipeImageView.image = selectedImage
            
        }

    }

    
    
    @IBAction func myRecipeAddButtonTapped(sender: UIButton)
    {
        myRecipes.ingredientsArray.append(myRecipeTextField.text!)
        myRecipeTextField.text = ""
        myRecipeTextField.resignFirstResponder()
        
        myRecipeTableView.reloadData()
    }
    
    
    
    @IBAction func myRecipeEditButtonTapped(sender: UIButton)
    {
        myRecipeTableView.editing = !myRecipeTableView.editing
    }
    
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        myRecipes.instructions = myRecipeInstructions.text!
        myRecipes.image = myRecipeImageView.image
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myRecipes.ingredientsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell3 = self.myRecipeTableView.dequeueReusableCellWithIdentifier("cell3", forIndexPath: indexPath)
        cell3.textLabel?.text = myRecipes.ingredientsArray[indexPath.row]
        
        
        cell3.textLabel?.numberOfLines = 0
        
        
        return cell3
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            myRecipes.ingredientsArray.removeAtIndex(indexPath.row)
            
            myRecipeTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let ingredients = myRecipes.ingredientsArray[sourceIndexPath.row]
        myRecipes.ingredientsArray.removeAtIndex(sourceIndexPath.row)
        myRecipes.ingredientsArray.insert(ingredients, atIndex: destinationIndexPath.row)
    }

    
    
    
    
}
