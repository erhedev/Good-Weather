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
    
    private var weatherListViewModel = WeatherListViewModel()
   
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
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCitySegue" {
            
            prepareSegueForAddCity(segue: segue)
            
        } else if segue.identifier == "SettingsSegue" {
            prepareSegueForSettings(segue: segue)
        } else if segue.identifier == "WeatherDetailsSegue" {
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
    }
    
    private func  prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController, let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Details not found")
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
    }
    
    private func prepareSegueForAddCity(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation not found")
        }
        
        guard let addCityVC = nav.viewControllers.first as? AddCityViewController else {
            fatalError("AddCityVC Not found")
        }
        addCityVC.delegate = self
    }
    
    private func prepareSegueForSettings(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation not found")
        }

        guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsVC not found")
        }
        settingsVC.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as! WeatherCell
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
        return cell
    }

}

extension WheatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
}

extension WheatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        print("done")

        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}




