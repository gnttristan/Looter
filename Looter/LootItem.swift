//
//  LootItem.swift
//  Looter
//
//  Created by Tristan GINET on 1/19/24.
//

import Foundation
import SwiftUI

struct LootItem : Identifiable, Hashable {
    var id = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
}

let items: [LootItem] = [
    LootItem(name: "Magic Wand", type: .magic, rarity: .common, attackStrength: 5, game: randomGame()),
    LootItem(name: "Steel Armor", type: .poison, rarity: .uncommon, attackStrength: nil, game: randomGame()),
    LootItem(name: "Fire Sword", type: .thunder, rarity: .rare, attackStrength: 15, game: randomGame()),
    LootItem(name: "Health Potion", type: .ice, rarity: .common, attackStrength: nil, game: randomGame()),
    LootItem(name: "Amulet of Power", type: .unknown, rarity: .epic, attackStrength: 30, game: randomGame()),
    LootItem(name: "Swift Boots", type: .wind, rarity: .uncommon, attackStrength: nil, game: availableGames[5]),
]

enum ItemType: CaseIterable {
    case magic
    case fire
    case ice
    case wind
    case poison
    case thunder
    case dagger
    case shield
    case bow
    case ring
    case unknown

    func getLogo() -> String {
        switch self {
        case .magic: return "⭐️"
        case .fire: return "🔥"
        case .ice: return "❄️"
        case .wind: return "💨"
        case .poison: return "☠️"
        case .thunder: return "⚡️"
        case .dagger: return "🗡️"
        case .shield: return "🛡️"
        case .bow: return "🏹"
        case .ring: return "💍"
        case .unknown: return "🎲"
        }
    }
}


