//
//  ViewController.swift
//  TheProject
//
//  Created by Lucas Ferreira Machado Pinto on 21/05/24.
//

import UIKit

// Array of country side SP cities names
var countrySideSpCities = ["Holambra", "Águas de Lindoia", "Campos do Jordão", "Brotas", "Águas de São Pedro", "Atibaia", "Cunha", "Serra Negra", "Embu das Artes", "Aparecida"]

// Dictionary mapping city names to country names
var countryName: [String: String] = ["Holambra": "Brazil", "Águas de Lindoia": "Brazil", "Campos do Jordão": "Brazil", "Brotas": "Brazil", "Águas de São Pedro": "Brazil", "Atibaia": "Brazil", "Cunha": "Brazil", "Serra Negra": "Brazil", "Embu das Artes": "Brazil", "Aparecida": "Brazil"]

// Defines a view controller class that inherits from UIViewController
class ViewController: UIViewController {
    // Connects the citiesTableView outlet to a UITableView in the Interface Builder
    @IBOutlet var citiesTableView: UITableView!
    
    // Struct to hold constant values
    struct Constants {
        static let cellIdentifier = "CoutrySideSpCitiesCell"
    }
    
    // Called after the controller's view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Registers a UITableViewCell class for reuse with the specified identifier
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
}

// Extension to conform to UITableViewDataSource protocol
extension ViewController: UITableViewDataSource {
    // Returns the number of rows in a given section of a table view
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return countrySideSpCities.count
    }

    // Returns the number of sections in a table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Configures and provides a cell for a given index path
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeues a reusable cell with the specified identifier
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        // Initialize a default content configuration for the table view cell
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        
        // Retrieves the city name for the current index path
        let countrySideSpCititesName = countrySideSpCities[indexPath.row]
        
        // Sets the text of the cell's content configuration to the corresponding city name
        cellContentConfiguration.text = countrySideSpCititesName
        
        // Sets the secondary text of the cell's content configuration to the corresponding country name
        cellContentConfiguration.secondaryText = countryName[countrySideSpCititesName] ?? ""
        
        // Assign the configured content to the table view cell
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

// Extension to conform to UITableViewDelegate protocol
extension ViewController: UITableViewDelegate {
    // Called when a cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Prints the city and country name of the selected cell
        print("user tapped on cell at \(countrySideSpCities[indexPath.row]) from \(countryName[countrySideSpCities[indexPath.row]]!)")
        
        // Deselects the cell with animation
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
