//
//  CodeInserterswift
//  ContaDigitalRealize
//
//  Created by Arthur Giachini on 06/11/19.
//  Copyright (c) 2019 Arthur Giachini. All rights reserved.
//

import UIKit

public enum NumberOfDigitTextFields: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
}

enum ShouldReturnDigit {
    case wait
    case yes
    case no
}

protocol ReturnDigit {
    func returnDigit() -> Void
}

public class CodeInserterStackView: UIStackView {
    
    private var digitTextFields: [DigitTextField] = []
    private var numberOfDigitTextFields: NumberOfDigitTextFields!
    
    private var activeTextField: UITextField!
    
    static var returnDigit: ShouldReturnDigit = .no
    
    open var shouldReturnDigit: Bool = true // default is YES, which returns to the previous textfield when the backspace is tapped.
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createDigitTextFields(numberOfDigitTextFields: .four, spacing: 10)
    }
    
    public required init(numberOfDigitTextFields: NumberOfDigitTextFields, spacing: CGFloat) {
        super.init(frame: CGRect.zero)
        createDigitTextFields(numberOfDigitTextFields: numberOfDigitTextFields, spacing: spacing)
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createDigitTextFields(numberOfDigitTextFields: NumberOfDigitTextFields, spacing: CGFloat) {
        self.numberOfDigitTextFields = numberOfDigitTextFields
        self.spacing = spacing
        for _ in 0..<numberOfDigitTextFields.rawValue {
            digitTextFields.append(DigitTextField())
        }
        configure()
    }
    
    private func configure() {
        
        axis = .horizontal
        distribution = .fillEqually
       
        for digitTextField in digitTextFields {
            digitTextField.delegate = self
            digitTextField.returnDigitDelegate = self
            digitTextField.heightAnchor.constraint(equalTo: digitTextField.widthAnchor, multiplier: 1.2).isActive = true
            addArrangedSubview(digitTextField)
        }
    }
}

//MARK: Public functions
extension CodeInserterStackView {
    // Return YES if all the digitTextFields are filled
    public func allDigitsTextfieldsFilled() -> Bool {
        let digitsInTextFieldsFilled = digitTextFields.filter { $0.text?.isEmpty == false }.count
        if digitsInTextFieldsFilled == digitTextFields.count {
            return true
        } else {
            return false
        }
    }
}

//MARK: ReturnDigit
extension CodeInserterStackView: ReturnDigit {
    func returnDigit() {
        if digitTextFields.first != activeTextField && shouldReturnDigit {
            if activeTextField.text?.isEmpty == true {
                let index = digitTextFields.firstIndex(of: activeTextField as! DigitTextField) ?? 0
                UIView.animate(withDuration: 0.1) {
                    self.digitTextFields[index-1].becomeFirstResponder()
                }
            }
        }
    }
}

//MARK: UITextFieldDelegates
extension CodeInserterStackView: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        if textField.text?.isEmpty == false {
            CodeInserterStackView.returnDigit = .no
        } else {
            CodeInserterStackView.returnDigit = .yes
        }
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        if textField.text?.isEmpty == false {
            CodeInserterStackView.returnDigit = .wait
        }
        
        if !string.isEmpty && digitTextFields.last != textField {
            textField.text = string
            let index = digitTextFields.firstIndex(of: textField as! DigitTextField) ?? 0
            UIView.animate(withDuration: 0.1) {
                self.digitTextFields[index+1].becomeFirstResponder()
            }
        } else if !string.isEmpty && digitTextFields.last == textField {
            textField.text = string
            endEditing(true)
        }

        return count <= 1
    }
    
}

