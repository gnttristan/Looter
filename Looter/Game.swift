import Foundation
import SwiftUI

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable, Equatable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "Elden Ring"),
    Game(name: "Skyrim", genre: .rpg, coverName: "Skyrim"),
    Game(name: "WoW", genre: .mmorpg, coverName: "WoW"),
    Game(name: "CS:GO", genre: .fps, coverName: "CS-GO"),
    Game(name: "Diablo IV", genre: .looter, coverName: "Diablo IV"),
    Game(name: "Lig of Gigarturr", genre: .looter, coverName: "")
]

func randomGame() -> Game {
    return availableGames.randomElement()!
}
