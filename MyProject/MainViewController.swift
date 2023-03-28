//
//  ViewController.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 27.03.2023.
//

import UIKit

private var person = Person.getPerson()

final class MainViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var resultPressedBurtton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var surnameTF: UITextField!
    
    @IBOutlet var heightTF: UITextField!
    @IBOutlet var weightTF: UITextField!
    
    @IBOutlet var phoneNumberTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureImageView.image = UIImage(named: "индекс массы")
        resultPressedBurtton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        pictureImageView.layer.cornerRadius = 40
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabarVC = segue.destination as? TabbarViewController else { return }
        guard let tabBarviewcontrollers = tabarVC.viewControllers else { return }
        
        for viewcontroller in tabBarviewcontrollers {
            if let formVC = viewcontroller as? FormTableViewController {
                formVC.person = person
            } else if let recomentVC = viewcontroller as? RecomentViewController {
                recomentVC.person = person
            }
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func getResult() {
        
            
                performSegue(withIdentifier: "showtabBar", sender: .none)
    
        }
    @IBAction func canselInfo() {
        nameTF.text = ""
        surnameTF.text = ""
        phoneNumberTF.text = ""
        emailTF.text = ""
        heightTF.text = ""
        weightTF.text = ""
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
            switch textField {
            case nameTF:
                person.name = text
            case surnameTF:
                person.surname = text
            case heightTF:
                person.heght = Double(text) ?? 0.0
            case weightTF:
                person.weight = Double(text) ?? 0.0
            case phoneNumberTF:
                person.phone = text
            default:
                person.email = text
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
extension MainViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
