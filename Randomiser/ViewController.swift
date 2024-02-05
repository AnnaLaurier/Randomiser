//
//  ViewController.swift
//  Randomiser
//
//  Created by Anna Lavrova on 05.02.2024.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var randomValueLabel: UILabel!

    @IBOutlet weak var getNumberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNumberButton.layer.cornerRadius = 10
    }


    @IBAction func getRandomNumberTapped() {
        let minimumNumber = Int(minimumValueLabel.text ?? "") ?? 0
        let maximumNumber = Int(maximumValueLabel.text ?? "") ?? 100

        randomValueLabel.text = String(Int.random(in: minimumNumber ... maximumNumber))
    }
    

}

