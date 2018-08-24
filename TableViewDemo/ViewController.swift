//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Florian Praile on 24/08/2018.
//  Copyright © 2018 Underside. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var values = ["Section 1": ["Hello", "world", "123", "nzlhf"],
                  "Section 2": ["Hello", "test", "test", "test"],
                  "Section 3": ["Hello", "123"],
                  "Section 4": ["123", "123", "123"],
                ]
    
    var sortedKeys: [String]{
        return Array(values.keys).sorted(by: <)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- TableView Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return values.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sortedKeys[section]
        return values[section]!.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sortedKeys[indexPath.section]
        let elt = values[section]![indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CellDemo", for: indexPath)
        cell.textLabel?.text = elt
        cell.detailTextLabel?.text = "hello"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedKeys[section]
    }
}

