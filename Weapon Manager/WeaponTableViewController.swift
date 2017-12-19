//
//  WeaponTableViewController.swift
//  Weapon Manager
//
//  Created by dan.smith on 12/18/17.
//  Copyright © 2017 dan.smith. All rights reserved.
//

import UIKit

class WeaponTableViewController: UITableViewController {
    //MARK: Properties
    
    var weapons = [Weapon]()
    
    //MARK: Actions
    
    @IBAction func unwindToWeaponList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? WeaponViewController, let weapon = sourceViewController.weapon {
            
            // Add a new weapon.
            let newIndexPath = IndexPath(row: weapons.count, section: 0)
            
            weapons.append(weapon)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleWeapons();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weapons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentfier = "weaponTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentfier, for: indexPath) as? weaponTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let weapon = weapons[indexPath.row]
        
        cell.nameLabel.text = weapon.name

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
    
    private func loadSampleWeapons() {
        guard let weapon1 = Weapon(name: "Scout Rifle") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let weapon2 = Weapon(name: "Auto Rifle") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let weapon3 = Weapon(name: "Hand Canon") else {
            fatalError("Unable to instantiate meal1")
        }
        
        weapons += [weapon1, weapon2, weapon3]
    }

}
