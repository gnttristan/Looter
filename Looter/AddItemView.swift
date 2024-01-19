//
//  AddItemView.swift
//  Looter
//
//  Created by Tristan GINET on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    @State var name: String = ""
    @State var rarity: Rarity = .common
    
    var body: some View {
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Button(action: {
                addItem()
            }, label: {
                Text("Ajouter")
            })
        }
    }
    
    func addItem() {
        inventory.addItem(item: name)
        dismiss()
    }
    
    enum Rarity: CaseIterable {
        case common
        case uncommon
        case rare
        case epic
        case legendairy
        case unique
        
        func getLogo() -> Color {
            switch self {
            case .common: return Color.white
            case .uncommon: return Color.gray
            case .rare: return Color.blue
            case .epic: return Color.yellow
            case .legendairy: return Color.red
            case .unique: return Color.purple
            }
        }
    }
}

#Preview {
    AddItemView(name: "namePreview", rarity: .common)
}
    
