//
//  MoneyTextFieldDelegate.swift
//  TextFields
//
//  Created by kweonyoungmin on 2015. 5. 1..
//  Copyright (c) 2015년 Udacity. All rights reserved.
//

import Foundation
import UIKit

class MoneyTextFieldDelegate: NSObject, UITextFieldDelegate {
  
    var oldNum = 0
    var newNum = 0
    var resultNum = 0.0
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if string != ""{
            newNum = string.toInt()!
            
            oldNum = oldNum * 10 + newNum
            
            resultNum = Double(oldNum) / 100
            
            textField.text = "$\(resultNum)"
            return false
        }else{
            oldNum = oldNum / 10
            resultNum = Double(oldNum) / 100
            textField.text = "$\(resultNum)"
            println("newNum : \(newNum) // oldNum : \(oldNum)")
            return false
        }
        
    }
    
}