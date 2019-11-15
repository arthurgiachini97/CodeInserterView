//
//  ViewController.swift
//  CodeInserterView
//
//  Created by Arthur Giachini on 11/09/2019.
//  Copyright (c) 2019 Arthur Giachini. All rights reserved.
//

import UIKit
import CodeInserterView

class ViewController: UIViewController {
    
    var codeInserterStackView = CodeInserterStackView(numberOfDigitTextFields: .four, spacing: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        codeInserterStackView.shouldReturnDigit = true
    }

    private func configure() {
        view.backgroundColor = .white
        
        codeInserterStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(codeInserterStackView)
        
        NSLayoutConstraint.activate([
            codeInserterStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeInserterStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeInserterStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
    }
}

