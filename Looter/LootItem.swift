//
//  LootItem.swift
//  Looter
//
//  Created by Tristan GINET on 1/19/24.
//

import Foundation
import SwiftUI

struct lookItemView: View {
    @State var name: String = ""
    @State var type: ItemType = .unknown
    @State var rarity: Rarity = .common
    @State var attackStrength: Int = 0
    @State var game: Game = .common
    
    var body: some View {
        return
    }
    
}

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


