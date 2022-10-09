//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var logoAnimalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getAnimalInfo()
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getAnimalInfo () {
        let animals = answers.map { $0.animal }
        var counts:[Animal:Int] = [:]
        
        animals.forEach { counts[$0, default: 0] += 1 }

        guard let animal = counts
                .sorted(by: { $0.value > $1.value })
                .first?
                .key else { return }
        
        logoAnimalLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}
