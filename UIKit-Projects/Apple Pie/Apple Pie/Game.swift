//
//  Game.swift
//  Apple Pie
//
//  Created by Tanmay Kataria on 22/07/25.
//

import Foundation

struct Game{
    var word : String
    var incorrectMovesRemaining : Int
    var guessedLetters : [Character]
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    var formattedWord: String{
        var guessedWord = ""
        for letter in word{
            if guessedWord.contains(letter){
                guessedWord += "\(letter)"
            }else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}


