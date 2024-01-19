//
//  ViewController.swift
//  ToolBox
//
//  Created by Chen Yue on 2/01/24.
//

import UIKit
import SwiftUI

fileprivate struct TableSection {
    let title: String
    let items: [String]
}

class RootViewController: UIViewController {
    
    private let tableSections = [TableSection(title: "UI",
                                              items: ["Loading", 
                                                      "Tags",
                                                      "Toast",
                                                      "Parallax ScrollView"])]
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
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIViewController()
        
        if indexPath.section == 0 {
            switch(indexPath.row) {
            case 0:
                let loadingView = ShimmerLoadingView()
                vc.addSubSwiftUIView(loadingView)
            case 1:
                let tagsView = TagsContentView()
                vc.addSubSwiftUIView(tagsView)
            case 2:
                let toastView = ToastContentView()
                vc.addSubSwiftUIView(toastView)
            case 3:
                let scrollView = ParallaxScrollView()
                vc.addSubSwiftUIView(scrollView)
            default:
                break
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

// MARK: - UITableViewDataSource
extension RootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(tableSections[section].title)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableSections[section].items.count
    }
    
    // Create and configure each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableSections[indexPath.section].items[indexPath.row]
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}
