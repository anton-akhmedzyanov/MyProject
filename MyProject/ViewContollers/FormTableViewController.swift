//
//  FormTableViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 27.03.2023.
//

import UIKit

final class FormTableViewController: UITableViewController {
    
    var person: Person!
    let titles = Person.getTitles()
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        person.fullForm.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let text = person.fullForm[indexPath.section]
        content.text = text
        
        cell.contentConfiguration = content
        return cell
    }
    
}
//MARK: - UITableViewDelegeta
extension FormTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let content = UILabel()
        content.text = titles[section]
        content.textColor = .white
        content.backgroundColor = .lightGray
        content.font = UIFont.boldSystemFont(ofSize: 17)
        
//        content.frame(forAlignmentRect: CGRect(x: 20, y: 4, width: 300, height: 20))
//        let contentView = UIView()
//        contentView.addSubview(content)
//        return contentView
        // если хочу сделать отступ, то текст в секции полностью изчезает
       
        return content
    }
}

// также при возвращение на 1 страницу, не могу понять как настроить кнопку back button Navigation, чтобы сбрасывала все данные? котрые были введены ранее
// возможно ли вообще прописать логику в  back button Navigation?
