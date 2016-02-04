//
//  FirstViewController.swift
//  To Do List
//
//  Created by Simranjit Kaur on 4/02/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import UIKit

//Global variable accesible in First and Second View Controller
var toDoList = [String]()

class FirstViewController: UIViewController , UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if  NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]!
        
        }
    
    }
    
    @IBOutlet weak var toDoListTable: UITableView!
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
    if editingStyle == UITableViewCellEditingStyle.Delete
    {
        toDoList.removeAtIndex(indexPath.row)
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
       toDoListTable.reloadData()
    
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
    return toDoList.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
    let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    
    }
    
   
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

