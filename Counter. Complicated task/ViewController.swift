//
//  ViewController.swift
//  Counter. Complicated task
//
//  Created by Ян Максимов on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyOfChangesTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    var counterValue = 0
    var historyText = "История изменений:\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "\(counterValue)"
        historyOfChangesTextView.text = historyText
        historyOfChangesTextView.isEditable = false
        historyOfChangesTextView.isScrollEnabled = true
    }

    @IBAction func tapPlusButton(_ sender: Any) {
        counterValue += 1
        counterLabel.text = "Значение счётчика: \(counterValue)"
        let startDate = Date()
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd.MM.YYYY HH:mm"
        let dateString = formatDate.string(from: startDate)
        historyText += "\(dateString): значение изменено на +1\n"
        historyOfChangesTextView.text = historyText
    }
    
    @IBAction func tapMinusButton(_ sender: Any) {
        if counterValue > 1 {
            counterValue -= 1
            counterLabel.text = "Значение счётчика: \(counterValue)"
            let startDate = Date()
            let formatDate = DateFormatter()
            formatDate.dateFormat = "dd.MM.YYYY HH:mm"
            let dateString = formatDate.string(from: startDate)
            historyText += "\(dateString): значение изменено на -1\n"
            historyOfChangesTextView.text = historyText
        } else {
            counterLabel.text = "Значение счётчика: \(counterValue)"
            let startDate = Date()
            let formatDate = DateFormatter()
            formatDate.dateFormat = "dd.MM.YYYY HH:mm"
            let dateString = formatDate.string(from: startDate)
            historyText += "\(dateString): попытка уменьшить значение счётчика ниже 0\n"
            historyOfChangesTextView.text = historyText
        }
        
    }
    
    @IBAction func tapResetButton(_ sender: Any) {
        counterValue = 0
        counterLabel.text = "Значение счётчика: \(counterValue)"
        let startDate = Date()
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd.MM.YYYY HH:mm"
        let dateString = formatDate.string(from: startDate)
        historyText += "\(dateString): значение сброшено\n"
        historyOfChangesTextView.text = historyText
    }
    

}

