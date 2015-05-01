//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by kweonyoungmin on 2015. 5. 1..
//  Copyright (c) 2015년 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var redRandomColorValue = CGFloat((arc4random()%100))/100.0
        var greenRandomColorValue = CGFloat((arc4random()%100))/100.0
        var blueRandomColorValue = CGFloat((arc4random()%100))/100.0
        var alphaRandomColorValue = CGFloat((arc4random()%100))/100.0
        
        textField.textColor = UIColor(red: redRandomColorValue, green: greenRandomColorValue, blue: blueRandomColorValue, alpha: 1.0)
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
    
    
}
