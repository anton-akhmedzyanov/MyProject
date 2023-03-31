//
//  ViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 27.03.2023.
//

import UIKit

private var person = Person.initial

final class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var resultPressedBurtton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var surnameTF: UITextField!
    
    @IBOutlet var telephoneTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var heightTF: UITextField!
    @IBOutlet var weightTF: UITextField!
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureImageView.image = UIImage(named: "индекс массы")
        resultPressedBurtton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        pictureImageView.layer.cornerRadius = 40
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabarVC = segue.destination as? UITabBarController else { return }
        guard let viewContrrollers = tabarVC.viewControllers else { return }
        
        viewContrrollers.forEach { viewcontroller in
            if let formTableVC = viewcontroller as? FormTableViewController {
                formTableVC.person = person
            } else if let indexResultVC = viewcontroller as? IndexMassViewController {
                indexResultVC.person = person
            } else { return }
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
// MARK: - IBActions
    
    @IBAction func getResult() {
        if person.fullForm.contains("") {
            showAlert(with: "Недостатчно информации!", and: "Заполните, пожалуйста все поля!")
        } else {
            performSegue(withIdentifier: "showtabBar", sender: .none)
        }
    }
    
    @IBAction func canselInfo() {
        nameTF.text = ""
        surnameTF.text = ""
        telephoneTF.text = ""
        emailTF.text = ""
        heightTF.text = ""
        weightTF.text = ""
    }
}

// MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
            switch textField {
            case nameTF:
                person.name = text
            case surnameTF:
                person.surname = text
            case telephoneTF:
                person.phone = text
            case emailTF:
                person.email = text
            case heightTF:
                person.height = text
            default:
                person.weight = text
            }
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboard = UIToolbar()
        keyboard.sizeToFit()
        textField.inputAccessoryView = keyboard
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil, action: nil )
        
        keyboard.items = [flexButton, doneButton]
    }
}

// MARK: - UIAlert

extension MainViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

