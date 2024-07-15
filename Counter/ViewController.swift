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
    
    private var counterValue = UserDefaults.standard.integer(forKey: "counterValue")
    
    private var date = ""
    
    private let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
        
        if UserDefaults.standard.string(forKey: "historyTextView") == nil {
            UserDefaults.standard.set("История изменений: \n", forKey: "historyTextView")
        }
        
        historyTextView.text = UserDefaults.standard.string(forKey: "historyTextView") ?? String()
        
    }
    
    private func updateData() {
        dateFormatter.dateFormat = "dd MMMM, yyyy 'at' HH:mm"
        date = dateFormatter.string(from: Date())
    }
    
    @IBAction private func incrementCounter(_ sender: Any) {
        updateData()
        counterValue += 1
        UserDefaults.standard.set(counterValue, forKey: "counterValue")
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
        historyTextView.text += "\(date): значение изменено на +1 \n"
        UserDefaults.standard.set(historyTextView.text, forKey: "historyTextView")
    }
    
    @IBAction private func decrementCounter(_ sender: Any) {
        updateData()
        if counterValue <= 0 {
            historyTextView.text += "\(date): попытка уменьшить значение счётчика ниже 0 \n"
            UserDefaults.standard.set(historyTextView.text, forKey: "historyTextView")
        } else {
            counterValue -= 1
            UserDefaults.standard.set(counterValue, forKey: "counterValue")
            historyTextView.text += "\(date): значение изменено на -1 \n"
            UserDefaults.standard.set(historyTextView.text, forKey: "historyTextView")
        }
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
    }
    
    @IBAction private func resetCounter(_ sender: Any) {
        updateData()
        counterValue = 0
        UserDefaults.standard.set(counterValue, forKey: "counterValue")
        counterTextLabel.text = "Значение счётчика: \(String(counterValue))"
        historyTextView.text = "История изменений: \n \(date): значение сброшено \n"
        UserDefaults.standard.set(nil, forKey: "historyTextView")
    }
    
}


