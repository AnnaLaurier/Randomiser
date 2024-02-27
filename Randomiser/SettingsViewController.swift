//
//  SettingsViewController.swift
//  Randomiser
//
//  Created by Anna Lavrova on 05.02.2024.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!

    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
        minimumValueTF.text = String(randomNumber.minimumValue)
        maximumValueTF.text = String(randomNumber.maximumValue)
    }
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @IBAction func saveButtonTapped() {
        view.endEditing(true)
        delegate.setNewValues(for: randomNumber)
        dismiss(animated: true)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        
        if textField == minimumValueTF {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
}
