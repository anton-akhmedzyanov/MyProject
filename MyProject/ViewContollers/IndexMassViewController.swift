//
//  IndexMassViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 30.03.2023.
//

import UIKit

final class IndexMassViewController: UIViewController {

   var person: Person!
   @IBOutlet var resultIndexLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        resultIndexLabel.text = " Индекс массы - \(person.indexMass.formatted())"
    }

}
