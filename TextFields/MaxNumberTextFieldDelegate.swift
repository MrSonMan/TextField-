//
//  MaxNumberTextFieldDelegate.swift
//  TextFields
//
//  Created by kweonyoungmin on 2015. 5. 1..
//  Copyright (c) 2015년 Udacity. All rights reserved.
//

import Foundation
import UIKit

class MaxNumberTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        if newText.length < 6 {
            return true
        }else{
            return false
        }
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    

}