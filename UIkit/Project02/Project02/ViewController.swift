//
//  ViewController.swift
//  Project02
//
//  Created by 한수빈 on 2022/09/19.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 1.0, green : 0.6, blue : 0.2, alpha : 1.0).cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action : UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in : 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        
        title = countries[correctAnswer].uppercased() + " ( score : \(score) )"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        var comment : String
        
        count += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            comment = "Congratulations!"
            score += 1
        } else {
            title = "Wrong"
            comment = "Your choice is \(countries[sender.tag].uppercased()) !"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)\n" + comment, preferredStyle: .alert)
        
        if count == 10 {
            let fa = UIAlertController(title: "Finished!", message: "You have answered 10 questions!", preferredStyle: .alert)
            fa.addAction(UIAlertAction(title: "Done", style: .default))
            present(fa, animated: true)
        }else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
        }
        
        
      
        
    }
    
}

