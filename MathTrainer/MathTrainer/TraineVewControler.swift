//
//  TraineVewControler.swift
//  MathTrainer
//
//  Created by Artem Yershov on 11.07.2023.
//

import Foundation
import UIKit

final class TrainViewControler: UIViewController {
    
    // MARK: - Properties
    var type: MathTypes = .add
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet var backButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        shadowButtons()
        configBackButton()
    }
    // MARK: - Methods
    private func shadowButtons() {
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.4
        }
    }
    private func configBackButton() {
        backButton.backgroundColor = .systemYellow
        backButton.tintColor = .black
        backButton.setTitle("Back", for: .normal)
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        backButton.layer.shadowRadius = 4
        backButton.layer.shadowOpacity = 0.4
        backButton.layer.cornerRadius = 15
    }
}
