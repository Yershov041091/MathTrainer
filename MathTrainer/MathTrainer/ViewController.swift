//
//  ViewController.swift
//  MathTrainer
//
//  Created by Artem Yershov on 10.07.2023.
//

import UIKit

enum MathTypes: Int {
    case add, substract, multiply, divide
}

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configeButtons()
    }
    
    // MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
    }
    
    // MARK: - Methods
    private func configeButtons() {
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 3, height: 5)
            button.layer.shadowOpacity = 0.6
            button.layer.shadowRadius = 4
        }
    }
}

