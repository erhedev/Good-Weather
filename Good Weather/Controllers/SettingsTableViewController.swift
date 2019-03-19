//
//  SettingsTableViewController.swift
//  Good Weather
//
//  Created by Erik Hede on 2019-03-19.
//  Copyright © 2019 Erik Hede. All rights reserved.
//

import Foundation
import UIKit


class SettingsTableViewController: UITableViewController {
    
    private var settingsVm = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true;
    }
    
    @IBAction func done() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsVm.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = self.settingsVm.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == self.settingsVm.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
        
    }
    
}
