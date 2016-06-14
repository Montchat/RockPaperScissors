
//Rock, Paper, Scissors

import Foundation

class Player {
    
    var points:Int = 0
    var choice = Choice.Rock
    
    enum Choice { case Rock, Paper, Scissors }
    
    func choose(_choice:Choice) -> Choice {
        choice = _choice
        return choice
    }
    
}

class ComputerOpponent: Player {
    
    func choose() -> Choice {
        
        var choice: Choice = Choice.Paper
        
        let randomNumber = Int(arc4random_uniform(3) + 1)
        
        switch randomNumber {
        case 0:
            choice = .Rock
            return choice
        case 1:
            choice = .Paper
            return choice
        case 2:
            choice = .Scissors
            return choice
        default:
            choice = .Rock
            return choice
        }
        
    }
    
}



func rockPapperScissorsShoot(player:Player, choice:Player.Choice, opponent: ComputerOpponent) -> Player? {
    
    player.choice = player.choose(choice)
    
    opponent.choice = opponent.choose()
    
    let winner = checkForWinBetween(playerOne: player, playerTwo: opponent)
    
    if winner == nil { print("tie") }

    winner?.points += 1
    
    return winner
    
}

func checkForWinBetween(playerOne playerOne:Player, playerTwo:Player) -> Player? {
    
    var winner:Player?
    
    //Player One Win Conditions:
    
    if playerOne.choice == .Rock && playerTwo.choice == .Scissors { winner = playerOne ; return winner }
    if playerOne.choice == .Scissors && playerTwo.choice == .Paper { winner = playerOne ; return winner }
    if playerOne.choice == .Paper && playerTwo.choice == .Rock { winner = playerOne ; return winner }
    
    //Player Two Win Conditions
    
    if playerTwo.choice == .Rock && playerOne.choice == .Scissors { winner = playerTwo ; return winner }
    if playerTwo.choice == .Scissors && playerOne.choice == .Paper { winner = playerTwo ; return winner }
    if playerTwo.choice == .Paper && playerOne.choice == .Rock { winner = playerTwo ; return winner }
    
    //Tie
    
    if playerOne.choice == playerTwo.choice { return nil }
    
    return winner
    
}

let playerOne = Player()
let playerTwo = ComputerOpponent()

rockPapperScissorsShoot(playerOne, choice: .Scissors, opponent: playerTwo)