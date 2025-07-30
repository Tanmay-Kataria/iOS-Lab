//
//  ViewController.swift
//  bmiCalculator
//
//  Created by Tanmay Kataria on 14/07/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var WeightTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var bmiResultLabel: UILabel!
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        let weightString = WeightTextField.text ?? ""
        let weight = Double(weightString) ?? 0
        let heightString = heightTextField.text ?? ""
        let height = Double(heightString) ?? 0
        let bmi = weight / (height * height)
        bmiResultLabel.text = "BMI is \(bmi)"
    }
    

}

