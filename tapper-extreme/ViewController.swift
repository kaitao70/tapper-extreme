//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Kai Tao Cheng on 11/05/2016.
//  Copyright © 2016 Kai Tao Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func dismissKeyboard(sender: AnyObject) {
        
        inputTextField.resignFirstResponder()
        
    }
    
    @IBAction func pressTapButton(sender: UIButton!){
        currentTaps += 1
        updateTextLabel()
        
        if isGameOver(){
            restartGame()
        }
        
    }
    @IBAction func pressPlayButton(sender: UIButton!){
   
        
        if inputTextField.text != nil && inputTextField.text != "" {
            
            logoImg.hidden = true
            playButton.hidden = true
            inputTextField.hidden = true
            
            tapButton.hidden = false
            textLabel.hidden = false
            
            maxTaps = Int(inputTextField.text!)!
            currentTaps = 2
            
            updateTextLabel()
        }
    }
    
    func updateTextLabel(){
        textLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps{
            return true
        }else{
            return false
        }
    }
    
    func restartGame(){
        maxTaps = 0
        textLabel.text = ""
        
        logoImg.hidden = false
        playButton.hidden = false
        inputTextField.hidden = false
        
        tapButton.hidden = true
        textLabel.hidden = true
        
    }
}

