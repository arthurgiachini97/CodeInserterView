//
//  DigitTextField.swift
//  CodeInserterView
//
//  Created by Arthur Giachini on 06/11/19.
//  Copyright (c) 2019 Arthur Giachini. All rights reserved.
//

import UIKit

class DigitTextField: UITextField {
    
    var returnDigitDelegate: ReturnDigit!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
        keyboardType = .numberPad
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 46, weight: .regular)
        adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        if CodeInserterView.returnDigit == .yes && text?.isEmpty == true {
            CodeInserterView.returnDigit = .no
            returnDigitDelegate.returnDigit()
        } else if CodeInserterView.returnDigit == .wait {
            CodeInserterView.returnDigit = .yes
        }
    }
}
