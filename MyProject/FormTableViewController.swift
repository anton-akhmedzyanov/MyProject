//
//  FormTableViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 27.03.2023.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    var person: Person!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        
        return cell
    }
    

}
