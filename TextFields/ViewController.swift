//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var maxNumber: UITextField!
    @IBOutlet weak var money: UITextField!
    
    @IBOutlet weak var switchOnOff: UISwitch!
    
    // Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()
    let maxNumberDelegate = MaxNumberTextFieldDelegate()
    let moneyDelegate = MoneyTextFieldDelegate()
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.hidden = true
        
        // Set the three delegates
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = self
        self.textField4.delegate = randomColorDelegate
        self.maxNumber.delegate = maxNumberDelegate
        self.money.delegate = moneyDelegate
        switchOnOff.setOn(false, animated: false)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return switchOnOff.on
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        println(string)
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // hide the label if the newText will be an empty string
        self.characterCountLabel.hidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
    }
    
    @IBAction func switchAction(sender: UISwitch) {
        if !switchOnOff.on{
            self.textField3.resignFirstResponder()
            self.textField3.text = ""
        }
    }
}











