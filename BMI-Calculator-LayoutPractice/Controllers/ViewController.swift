//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightAction(_ sender: UISlider) {
        var height: Float
        
        height = sender.value
        heightLabel.text = String(format: "%.2fm", height)
    }
    
    @IBAction func weightAction(_ sender: UISlider) {
        var weight: Int
        
        weight = Int(sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as? ResultViewController
            destinationVC?.bmiValue = calculatorBrain.getBMIValue()
            destinationVC?.advice = calculatorBrain.getAdvice()
            destinationVC?.color = calculatorBrain.getColor()
        }
    }
}

