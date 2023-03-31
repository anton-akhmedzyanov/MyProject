//
//  RecomentViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 28.03.2023.
//

import UIKit

final class RecomentViewController: UIViewController {
    
    @IBOutlet var textLabel: UILabel!
    var recomentText = Person.getRecoment()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = recomentText
        view.backgroundColor = .systemMint
    }
    
}
