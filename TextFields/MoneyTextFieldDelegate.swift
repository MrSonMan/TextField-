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
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
        //var i = 0
    }
    
    var i = 0
    var text = ""
    var text2 = ""
    var text3 = ""
    var lastText = ""
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        i = i+1
        
        if string != ""{
            if i == 1{
                text = string
                textField.text = "$0.0" + text
                return false
            }else if i == 2{
                text2 = string
                textField.text = "$0." + text + text2
                return false
            }else if i == 3{
                text3 = string
                textField.text = "$" + text + "." + text2 + text3
                lastText = text + "." + text2 + text3
                return false
            }else{
                lastText = lastText + string
                textField.text = "$" + lastText
                return false
            }
        }else if string == ""{
            textField.text = ""
            i = 0
        }
        return true
    }
}