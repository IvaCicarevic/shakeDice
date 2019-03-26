//
//  ViewController.swift
//  shakeDice
//
//  Created by Iva Cicarevic on 3/26/19.
//  Copyright © 2019 Iva Cicarevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dice1Image: UIImageView!
    @IBOutlet weak var dice2Image: UIImageView!
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6", ]
    
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func updateDiceImages() {
        
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        print(randomDiceIndex1)
        
        dice1Image.image = UIImage(named: diceArray[randomDiceIndex1])
        dice2Image.image = UIImage(named: diceArray[randomDiceIndex2])
        
    }
    
    func alert() {
        
        //  if dice1Image == dice2Image {
        
        let alert = UIAlertController(title: "Awesome", message: "You have got the game!", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
            self.updateDiceImages()
            })
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func rollDice(_ sender: UIButton) {
        
        updateDiceImages()
        
        if dice1Image.image == dice2Image.image {
            alert()
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            updateDiceImages()
            
            if dice1Image.image == dice2Image.image {
                alert()
            }
        }
    }
}


