//
//  WeatherListTableViewController.swift
//  Good Weather
//
//  Created by Erik Hede on 13/03/2019.
//  Copyright © 2019 Erik Hede. All rights reserved.
//

import Foundation
import UIKit

class WheatherListTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as! WeatherCell
        
        cell.cityNameLabel.text = "Houston"
        cell.temperatureLabel.text = "70°"
        
        return cell
    }


}




