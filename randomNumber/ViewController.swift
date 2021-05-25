//
//  ViewController.swift
//  randomNumber
//
//  Created by 羅承志 on 2021/5/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var remainingTimesLabel: UILabel!
    
    var answer = Int.random(in: 1...50)
    var remainingTimes = 5
    var min = 1
    var max = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "猜猜看吧！"
        remainingTimesLabel.text = "剩下\(remainingTimes)次機會"
    }

    @IBAction func guessButton(_ sender: UIButton) {
        view.endEditing(true)
        
        let guessNumberText = numberTextField.text!
        let guessNumber = Int(guessNumberText)
        if remainingTimes >= 0 {
            remainingTimes -= 1
            if let guessNumber = guessNumber {
                if guessNumber == answer {
                    resultLabel.text = "答對囉🥳"
                    resultLabel.sizeToFit()
                    remainingTimesLabel.text = "剩下\(remainingTimes)次機會"
                } else if guessNumber > answer {
                    max = guessNumber - 1
                    resultLabel.text = "太多了🤔(\(min) - \(guessNumber - 1))"
                    resultLabel.sizeToFit()
                    numberTextField.text = ""
                    if remainingTimes == 0 {
                        remainingTimesLabel.text = "請再挑戰一次"
                    } else {
                        remainingTimesLabel.text = "剩下\(remainingTimes)次機會"
                    }
                } else {
                    min = guessNumber + 1
                    resultLabel.text = "太少了🤔(\(guessNumber + 1) - \(max))"
                    resultLabel.sizeToFit()
                    numberTextField.text = ""
                    
                    if remainingTimes == 0 {
                        remainingTimesLabel.text = "請再挑戰一次"
                    } else {
                        remainingTimesLabel.text = "剩下\(remainingTimes)次機會"
                    }
                }
            }
        }
    }
    
    @IBAction func againButton(_ sender: UIButton) {
        view.endEditing(true)
        remainingTimes = 5
        answer = Int.random(in: 0...50)
        min = 0
        max = 50
        numberTextField.text = ""
        resultLabel.text = "猜猜看吧！"
        remainingTimesLabel.text = "剩下\(remainingTimes)次機會"
    }
}

