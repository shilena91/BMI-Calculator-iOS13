//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Hoang on 25.3.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        return (bmiString)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
    
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        }
        else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    func getAdvice() -> String {
        if let advice = bmi?.advice {
            return advice
        } else { return "" }
    }
    
    func getColor() -> UIColor {
        guard let color = bmi?.color else { return UIColor.clear }
        return (color)
    }
}
