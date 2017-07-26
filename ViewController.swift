//
//  ViewController.swift
//  ColourGame
//
//  Created by Peter Carruthers on 25/07/2017.
//  Copyright © 2017 PeterCarruthers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        reds = [redDialogue0, redDialogue1, redDialogue2, redDialogue3, redDialogue4, redDialogue5, redDialogue6]
        greens = [greenDialogue0, greenDialogue1, greenDialogue2, greenDialogue3, greenDialogue4, greenDialogue5, greenDialogue6]
        blues = [blueDialogue0, blueDialogue1, blueDialogue2, blueDialogue3, blueDialogue4, blueDialogue5, blueDialogue6]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var redValue: CGFloat = 0
    var greenValue: CGFloat = 0
    var blueValue: CGFloat = 0
    
    var redValueL: CGFloat = 0
    var greenValueL: CGFloat = 0
    var blueValueL: CGFloat = 0
    
    var redAction = 0
    var greenAction = 0
    var blueAction = 0
    
    let blueDialogue0 = "Perfect amount of Blue!"
    let blueDialogue1 = "Maybe a tiny bit more Blue."
    let blueDialogue2 = "Try a tiny bit less Blue"
    let blueDialogue3 = "You need a little more Blue."
    let blueDialogue4 = "Less Blue."
    let blueDialogue5 = "You need much more Blue."
    let blueDialogue6 = "Much less Blue, please."
    
    let redDialogue0 = "Perfect amount of Red!"
    let redDialogue1 = "Maybe a tiny bit more Red."
    let redDialogue2 = "Try a tiny bit less Red"
    let redDialogue3 = "You need a little more Red."
    let redDialogue4 = "Less Red."
    let redDialogue5 = "You need much more Red."
    let redDialogue6 = "Much less Red, please."
    
    let greenDialogue0 = "Perfect amount of Green!"
    let greenDialogue1 = "Maybe a tiny bit more Green."
    let greenDialogue2 = "Try a tiny bit less Green"
    let greenDialogue3 = "You need a little more Green."
    let greenDialogue4 = "Less Green."
    let greenDialogue5 = "You need much more Green."
    let greenDialogue6 = "Much less Green, please."
    
    var reds: [String] = []
    var greens: [String] = []
    var blues: [String] = []
    
    
    
    @IBOutlet weak var colourSquare: UIView!  // Square on the left

    @IBOutlet weak var colourSquare2: UIView! // Square on the right
    
    
    
    @IBAction func lessRedButton() {
        redValue -= 0.1
        if redValue < -1 {
            redValue = -1
        }
        secondSquare()
    }
    @IBAction func lessGreenButton() {
        greenValue -= 0.1
        if greenValue < -1 {
            greenValue = -1
        }
        secondSquare()
    }
    @IBAction func lessBlueButton() {
        blueValue -= 0.1
        if blueValue < -1 {
            blueValue = -1
        }
        secondSquare()
    }
    @IBAction func moreRedButton() {
        redValue += 0.1
        if redValue > 1 {
            redValue = 1
        }
        secondSquare()
    }
    @IBAction func moreGreenButton() {
        greenValue += 0.1
        if greenValue > 1 {
            greenValue = 1
        }
        secondSquare()
    }
    @IBAction func moreBlueButton() {
        blueValue += 0.1
        if blueValue > 1 {
            blueValue = 1
        }
        secondSquare()
    }
    
    func secondSquare() {
        colourSquare2.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
    }
    
    @IBAction func randomButton(_ sender: Any) {
        redValueL = CGFloat(Int(arc4random_uniform(10)))
        greenValueL = CGFloat(Int(arc4random_uniform(10)))
        blueValueL = CGFloat(Int(arc4random_uniform(10)))
        
        redValueL /= 10
        greenValueL /= 10
        blueValueL /= 10

        print("R = \(redValueL)")
        print("G = \(greenValueL)")
        print("B = \(blueValueL)")
        
        colourSquare.backgroundColor = UIColor(red: CGFloat(redValueL), green: CGFloat(greenValueL), blue: CGFloat(blueValueL), alpha: 1)
    }
    
    func checkEquivalency() {
    
        let redComparison = redValueL - redValue
        let greenComparison = greenValueL - greenValue
        let blueComparison = blueValueL - blueValue
        
        if blueComparison <= -0.5 {
            blueAction = 6
        } else if blueComparison <= -0.3 {
            blueAction = 4
        } else if blueComparison <= -0.05 {
            blueAction = 2
        } else if blueComparison >= 0.5 {
            blueAction = 5
        } else if blueComparison >= 0.3 {
            blueAction = 3
        } else if blueComparison >= 0.05 {
            blueAction = 1
        } else {
            blueAction = 0
        }
    
        if redComparison <= -0.5 {
            redAction = 6
        } else if redComparison <= -0.3 {
            redAction = 4
        } else if redComparison <= -0.05 {
            redAction = 2
        } else if redComparison >= 0.5 {
            redAction = 5
        } else if redComparison >= 0.3 {
            redAction = 3
        } else if redComparison >= 0.05 {
            redAction = 1
        } else {
            redAction = 0
        }
        if greenComparison <= -0.5 {
            greenAction = 6
        } else if greenComparison <= -0.3 {
            greenAction = 4
        } else if greenComparison <= -0.05 {
            greenAction = 2
        } else if greenComparison >= 0.5 {
            greenAction = 5
        } else if greenComparison >= 0.3 {
            greenAction = 3
        } else if greenComparison >= 0.05 {
            greenAction = 1
        } else {
            greenAction = 0
        }


        
        
        print("Red Comparison = \(redComparison)")
        print("Green Comparison = \(greenComparison)")
        print("Blue Comparison = \(blueComparison)")
        print("blueAction = \(blueAction)")
        print(reds[redAction])
        print(greens[greenAction])
        print(blues[blueAction])
    }
    
    @IBAction checkButton() {
    checkEquivalency()
    
    }
    /*
    @IBAction func showAlert() {
        
        let redDifference: String
        let greenDifference: String
        let blueDifference: String
        
        
        
        if redValueL == redValue {
            redDifference = "the same amount of Red"
        } else if redValueL > redValue {
            redDifference = "more Red"
        } else {
            redDifference = "less Red"
        }
        if greenValueL == greenValue {
            greenDifference = "the same amount of Green"
        } else if greenValueL > greenValue {
            greenDifference = "more Green"
        } else {
            greenDifference = "less Green"
        }
        if blueValueL == blueValue {
            blueDifference = "the same amount of Blue"
        } else if blueValueL > blueValue {
            blueDifference = "more Blue"
        } else {
            blueDifference = "less Blue"
        }
        let message = "Try \(redDifference)"
                        + "\nAlso, try \(greenDifference)"
                        + "\nFinally, try \(blueDifference)"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: nil)
        alert.addAction(action)
        
        present(alert, animated:true, completion:nil)
        print("L = \(redValueL), R = \(redValue)")
        print("L = \(greenValueL), R = \(greenValue)")
        print("L = \(blueValueL), R = \(blueValue)")
    }
 */
}


