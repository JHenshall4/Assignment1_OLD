//
//  ViewController.swift
//  TicTacToe - Assignment 1
//
//  Created by Chook on 28/3/17.
//  Copyright © 2017 Chook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var playerOneScore = 0
    var playerTwoScore = 0
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameNumber = 0
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameIsActive = true
    
    @IBOutlet weak var label : UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
        gameNumber = gameNumber + 1
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            whosTurn.isHidden = false
            whosTurn.text = "Player 1's' turn"
            
            if (activePlayer == 1)
            {
                whosTurn.text = "Player 2's turn"
                sender.setImage(UIImage(named: "cross"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "nought"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "PLAYER ONE WINS!"
                    playerOneScore = playerOneScore + 1
                    whosTurn.isHidden = true
                    matchHistory.text = matchHistory.text + "\n Player 1 won"
                    
                }
                else
                {
                    label.text = "PLAYER TWO WINS!"
                    playerTwoScore = playerTwoScore + 1
                    whosTurn.isHidden = true
                    matchHistory.text = matchHistory.text + "\n Player 2 won"
                    
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "IT WAS A DRAW"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
    }


    @IBOutlet weak var matchHistory: UITextView!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    @IBOutlet weak var whosTurn: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

