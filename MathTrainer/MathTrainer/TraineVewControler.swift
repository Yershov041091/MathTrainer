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
    var type: MathTypes = .add {
        didSet {
            switch type {
            case .add:
                sign = "+"
            case .divide:
                sign = "/"
            case .multiply:
                sign = "*"
            case .substract:
                sign = "-"
            }
        }
    }
    private var answer: Int {
        switch type {
        case .add:
            return firstNumber + secondNumber
        case .substract:
            return firstNumber - secondNumber
        case .divide:
            return firstNumber / secondNumber
        case .multiply:
            return firstNumber * secondNumber
        }
    }
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var quastionLable: UILabel!
    @IBOutlet var scoreLable: UILabel!
    
    private var sign: String = ""
    private var firstNumber = 0
    private var secondNumber = 0
    private var score = 0 {
        didSet {
            print("Score: \(score)")
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        configeScoreLable()
        configeQuestions()
        configButtons()
        configBackButton()
    }
    //MARK: - IBAction
    
    @IBAction func leftAction(_ sender: UIButton) {
        check(currentAnswer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        check(currentAnswer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    // MARK: - Methods
    private func configButtons() {
        buttonsCollection.forEach { button in
            button.backgroundColor = .systemYellow
        }
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.4
        }
        let isRight = Bool.random()
        var randomAnswer: Int
        repeat {
            randomAnswer = Int.random(in: (answer - 10)...(answer + 10))
        } while randomAnswer == answer
        
        buttonsCollection[0].setTitle(isRight ? "\(String(answer))" : "\(String(randomAnswer))", for: .normal)
        buttonsCollection[1].setTitle(isRight ? "\(String(randomAnswer))" : "\(String(answer))", for: .normal)
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
    private func configeQuestions() {
        
        if type == .divide {
            repeat {
                firstNumber = Int.random(in: 1...99)
                secondNumber = Int.random(in: 1...99)
            } while !firstNumber.isMultiple(of: secondNumber)

        } else {
            firstNumber = Int.random(in: 1...99)
            secondNumber = Int.random(in: 1...99)
        }
        let question = "\(firstNumber) \(sign) \(secondNumber) ="
        quastionLable.text = question
    }
    private func check(currentAnswer: String, for button: UIButton) {
        let isRigtUnswer = Int(currentAnswer) == answer
        
        button.backgroundColor = isRigtUnswer ? .systemGreen : .systemRed
        if isRigtUnswer {
            score += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.configeQuestions()
                self?.configButtons()
                self?.configeScoreLable()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.configeQuestions()
                self?.configButtons()
                self?.configeScoreLable()
            }
        }
    }
    private func configeScoreLable() {
        scoreLable.text = "Your score: \(score)"
        scoreLable.font.withSize(40)
        scoreLable.layer.cornerRadius = 40
        scoreLable.layer.shadowColor = UIColor.black.cgColor
        scoreLable.layer.shadowOffset = .init(width: 4, height: 4)
        scoreLable.layer.shadowOpacity = 0.4
    }
}
