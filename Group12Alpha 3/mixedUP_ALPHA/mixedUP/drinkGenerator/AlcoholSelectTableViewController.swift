//
//  AlcoholSelectTableViewController.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 11/19/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class AlcoholSelectTableViewController: UITableViewController
{
    var parentView: GeneratorViewController?
    var alcoholList: [Alcohol] = []
    //var possibleList: [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //parentView?.possibleList = possibleList
        
        //print(alcoholList[0].alcoholName)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return alcoholList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alcoholSelectCell", for: indexPath) as! AlcoholTableViewCell
        print(alcoholList[indexPath.row].alcoholName)
        
        //cell.possibleList = self.possibleList
        cell.alcoholName.text = alcoholList[indexPath.row].alcoholName
        
        if(parentView?.possibleList.contains(alcoholList[indexPath.row].alcoholName))!
        {
            cell.setToPostition.setOn(true, animated: false)
        }
        else
        {
            cell.setToPostition.setOn(false, animated: false)
        }
        
        
        cell.parentView = self
        
        
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
