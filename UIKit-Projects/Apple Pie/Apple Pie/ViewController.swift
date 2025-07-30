//
//  ViewController.swift
//  Apple Pie
//
//  Created by Tanmay Kataria on 20/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious", "bug", "program", "incadescent"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet{
            newRound()
        }
    }
    
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        
        //        let letterString = sender.title(for: .normal)!
        let letterString = sender.configuration!.title!
        
        let letter = Character(letterString.lowercased())
        
        currentGame.playerGuessed(letter: letter)
        
        updateUI()
        
        updateGameState()
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }else{
            updateUI()
        }
    }
    
    var currentGame: Game!
    
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            
            enableLetterButtons(true)
            
            updateUI()
            
        }else{
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable : Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        
        let wordsWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordsWithSpacing
        
        scoreLabel.text = "Wins: \(totalWins), Losses:\(totalLosses)"
        
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

}

