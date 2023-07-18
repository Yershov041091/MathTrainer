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
    @IBOutlet var scoreLablesCollection: [UILabel]!
    
    // MARK: - Properties
    var selectedType: MathTypes = .add
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configeButtons()
        configeScoreButtons()
    }
    
    // MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathTypes.init(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    @IBAction func backAction(anwindSegue: UIStoryboardSegue) {}
    
    // MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControler = segue.destination as? TrainViewControler {
            viewControler.type = selectedType
        }
    }
    
    private func configeButtons() {
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 3, height: 5)
            button.layer.shadowOpacity = 0.6
            button.layer.shadowRadius = 4
        }
    }
    private func configeScoreButtons() {
        scoreLablesCollection.forEach { lable in
            lable.font = .boldSystemFont(ofSize: 20)
            lable.textColor = .darkGray
        }
    }
}

