//
//  ViewController.swift
//  ToolBox
//
//  Created by Chen Yue on 2/01/24.
//

import UIKit

class RootViewController: UIViewController {
    
    // Initialize your table data
    let items = ["Item 1", "Item 2", "Item 3"]
    
    // Create a UITableView instance
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Root"
        // Initialize the tableView and set its delegate and data source
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register a UITableViewCell class with the tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Add the tableView to the view controller's view
        view.addSubview(tableView)
    }

}

// MARK: - UITableViewDelegate

extension RootViewController: UITableViewDelegate {
    
    // Add functionality when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // For example, print the name of the selected item
        print("Selected \(items[indexPath.row])")
        
        // Deselect the row after it's been tapped
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension RootViewController: UITableViewDataSource {
    
    // Return the number of rows for the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    // Create and configure each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Set the text for the cell from the items array
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
}
