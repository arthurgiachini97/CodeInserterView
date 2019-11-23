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
    
    var codeInserterView = CodeInserterView(numberOfDigitTextFields: .four, spacing: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        codeInserterView.shouldReturnDigit = true
    }

    private func configure() {
        view.backgroundColor = .white
        
        codeInserterView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(codeInserterView)
        
        NSLayoutConstraint.activate([
            codeInserterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeInserterView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeInserterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
    }
}

