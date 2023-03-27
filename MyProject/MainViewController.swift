//
//  ViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 27.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var resultPressedBurtton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureImageView.image = UIImage(named: "индекс массы")
        resultPressedBurtton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        pictureImageView.layer.cornerRadius = 40
    }
    
}
