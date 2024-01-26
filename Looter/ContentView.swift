import SwiftUI

class Inventory: ObservableObject {
    @Published var loot =     
        [LootItem(name: "Magic Wand", type: .magic, rarity: .common, attackStrength: 5, game: randomGame()),
           LootItem(name: "Steel Armor", type: .poison, rarity: .uncommon, attackStrength: nil, game: randomGame()),
           LootItem(name: "Fire Sword", type: .thunder, rarity: .rare, attackStrength: 15, game: randomGame()),
           LootItem(name: "Health Potion", type: .ice, rarity: .common, attackStrength: nil, game: randomGame()),
           LootItem(name: "Amulet of Power", type: .unknown, rarity: .epic, attackStrength: 30, game: randomGame()),
           LootItem(name: "Swift Boots", type: .wind, rarity: .uncommon, attackStrength: nil, game: availableGames[5])
        ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
    
    func editItem(id: UUID, item: LootItem) {
        if let index = loot.firstIndex(where: { $0.id == id }) {
            loot[index] = item
        }
    }
    
    enum LooterFeature {
        case loot
        case wishList
        case profile
    }
}


struct ContentView: View {
    var body: some View {
        LootView()
    }
}

//#Preview {
//    ContentView()
//}
