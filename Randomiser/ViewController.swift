//
//  ViewController.swift
//  Randomiser
//
//  Created by Anna Lavrova on 05.02.2024.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber)
}

final class ViewController: UIViewController {

    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var randomValueLabel: UILabel!

    @IBOutlet weak var getRandomNumberButton: UIButton!

    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)

    override func viewDidLoad() {
        super.viewDidLoad()

        getRandomNumberButton.layer.cornerRadius = 10

        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard 
            let navigationVC = segue.destination as? UINavigationController,
            let settingsVC = navigationVC.topViewController as? SettingsViewController
        else {
            return
        }

        settingsVC.randomNumber = randomNumber

        settingsVC.delegate = self
    }

    @IBAction func getRandomNumberTapped() {
        randomValueLabel.text = String(randomNumber.getRandom)
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else {
            return
        }

        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
    }
}

extension ViewController: SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
        self.randomNumber = randomNumber
    }
}
