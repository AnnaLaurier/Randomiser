//
//  ViewController.swift
//  Randomiser
//
//  Created by Anna Lavrova on 05.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var randomValueLabel: UILabel!

    @IBOutlet weak var getNumberButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        getNumberButton.layer.cornerRadius = 10
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}

        settingsVC.minimumValue = minimumValueLabel.text
        settingsVC.maximumValue = maximumValueLabel.text
    }

    @IBAction func getRandomNumberTapped() {
        let minimumNumber = Int(minimumValueLabel.text ?? "") ?? 0
        let maximumNumber = Int(maximumValueLabel.text ?? "") ?? 100

        randomValueLabel.text = String(Int.random(in: minimumNumber ... maximumNumber))
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else {return}
        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
    }
}
