//
//  ViewController.swift
//  Counter
//
//  Created by Maksim Zakharov on 15.06.2024.
//
// Дорогой код ревьюер. Я пришел с 0 опытом и багажем, поэтому большая просьба если можно, если будут замечания, напиши их с учетом, что мне сложно пока понимать сленг/термины/сложные темы. Зарание благодарю, удачного дня ^^

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterTextLabel: UILabel!
    
    @IBOutlet private weak var incrementCounterButton: UIButton!
    
    @IBOutlet private weak var decrementCounterButton: UIButton!
    
    @IBOutlet private weak var resetCounterButton: UIButton!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counterValue = 0
    
    private var date = ""
    
    private let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
        historyTextView.text = "История изменений: \n"
    }
    
    private func updateData() {
        dateFormatter.dateFormat = "dd MMMM, yyyy 'at' HH:mm"
        date = dateFormatter.string(from: Date())
    }
    
    @IBAction private func incrementCounter(_ sender: Any) {
        updateData()
        counterValue += 1
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
        historyTextView.text += "\(date): значение изменено на +1 \n"
    }
    
    @IBAction private func decrementCounter(_ sender: Any) {
        updateData()
        if counterValue <= 0 {
            historyTextView.text += "\(date): попытка уменьшить значение счётчика ниже 0 \n"
        } else {
            counterValue -= 1
            historyTextView.text += "\(date): значение изменено на -1 \n"
        }
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
    }
    
    @IBAction private func resetCounter(_ sender: Any) {
        updateData()
        counterValue = 0
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
        historyTextView.text += "\(date): значение сброшено \n"
    }
    
}


