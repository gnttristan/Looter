import SwiftUI

enum Rarity: CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendairy
    case unique
    
    func getColor() -> Color {
        switch self {
        case .common: return Color.green
        case .uncommon: return Color.gray
        case .rare: return Color.blue
        case .epic: return Color.yellow
        case .legendairy: return Color.red
        case .unique: return Color.purple
        }
    }
}
