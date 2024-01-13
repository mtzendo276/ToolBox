//
//  ViewController.swift
//  ToolBox
//
//  Created by Chen Yue on 2/01/24.
//

import UIKit
import SwiftUI

class RootViewController: UIViewController {
    
    let sections = ["UI"]
    let items = ["Item 1", "Item 2", "Item 3"]
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Root"
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.systemGroupedBackground
        view.addSubview(tableView)
    }

}

// MARK: - UITableViewDelegate
extension RootViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(items[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIViewController()
        
//        let loadingView = ShimmerLoadingView()
//        vc.addSubSwiftUIView(loadingView)
        
//        let tagsView = TagsContentView()
//        vc.addSubSwiftUIView(tagsView)
        
//        let toastView = ToastContentView()
//        vc.addSubSwiftUIView(toastView)
        
        let scrollView = ParallaxScrollView()
        vc.addSubSwiftUIView(scrollView)
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

// MARK: - UITableViewDataSource
extension RootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sections[section])"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Create and configure each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}
