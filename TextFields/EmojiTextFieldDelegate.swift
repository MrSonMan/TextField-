//
//  EmojiTextFieldDelegate.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate : NSObject, UITextFieldDelegate {
    
     var translations = [String : String]()    // var로 수정해야 함.. 왜 강의에선 let으로 했지???
    
    override init() {
        super.init()
        
        translations["heart"] = "\u{0001F496}"
        translations["fish"] = "\u{E522}"
        translations["bird"] = "\u{E523}"
        translations["frog"] = "\u{E531}"
        translations["bear"] = "\u{E527}"
        translations["dog"] = "\u{E052}"
        translations["cat"] = "\u{E04F}"
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var emojiStringRange: NSRange
        
        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)

        for (emojiString, emoji) in translations {
            
            emojiStringRange = newText.rangeOfString(emojiString, options: NSStringCompareOptions.CaseInsensitiveSearch)
           
            if emojiStringRange.location != NSNotFound {
                newText = newText.stringByReplacingCharactersInRange(emojiStringRange, withString: emoji)
                textField.text = String(newText)
                return false  // 여기서 return false를 안하면 이모티콘 바뀌고 마지막 글자 또 적히네...
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
}
