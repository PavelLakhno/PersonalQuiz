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
    // 1. Избавиться от кнопки возврата назад на экране результатов +
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let animal = getAnimalInfo()
        logoAnimalLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getAnimalInfo () -> Animal {
 
        let animals = answers.map { $0.animal }
        var counts:[Animal:Int] = [:]
        
        animals.forEach {
            counts[$0, default: 0] += 1
        }
        
        let animal = counts.max { $0.value < $1.value }!.key
        return animal
    }
}
