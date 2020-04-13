//
//  ViewController.swift
//  Guess The Number Game
//
//  Created by mac on 2020/04/10.
//  Copyright © 2020 hoon.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    private var guessNumber = 0
    private var countGuesses = 0
    private var guessAgain = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessNumber = Int(arc4random_uniform(100))
    }
    
    @IBAction func checkButton(_ sender: Any) {
        if guessAgain {
            countGuesses = 0
            inputText.text! = ""
            guessNumber = Int(arc4random_uniform(100))
            guessAgain = false
        }
        
        if Int(inputText.text!) != nil {
         
            let inputnum = Int(inputText.text!)
            countGuesses += 1
            
            if inputnum == guessNumber {
                displayLabel.text = "Congratulations. You got the number. It took You \(countGuesses) guesses to guess the number. Try Again ?"
                guessAgain = true
            } else if inputnum! < guessNumber{
                displayLabel.text = "Try higher number !!"
            } else if inputnum! > guessNumber {
                displayLabel.text = "Try lower number !!"
            }
            inputText.text = ""
        } else {
            displayLabel.text = "Please Enter a Number you are guessing !!"
        }
    }
    
}

