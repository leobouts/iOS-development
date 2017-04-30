//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Leonidas on 01/05/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound:AVAudioPlayer!
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        playsound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender:AnyObject){
        processOperation(operation: .Divide)
        
    }
    
    @IBAction func onMultiplyPressed(sender:AnyObject){
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender:AnyObject){
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender:AnyObject){
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender:AnyObject){
        processOperation(operation: currentOperation)
    }
    
    

    
    func playsound(){
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
        
    }
    
    func processOperation(operation: Operation){
        playsound()
        if currentOperation != Operation.Empty{
            
            //A user selected an operator, but then selected another operator without first entering a number
            
            if runningNumber != ""{
                
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }else if currentOperation == Operation.Add{
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            
            currentOperation = operation
                
            }else{ //First time an operator has been pressed
                
                leftValStr = runningNumber
                runningNumber = ""
                currentOperation = operation

            }
        }
            
}

