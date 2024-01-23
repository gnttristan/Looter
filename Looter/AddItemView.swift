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
    @State var type: ItemType = .bow
    @State var rarity: Rarity = .common
    @State var quantity: Int = 1
    @State var isAttack: Bool = false
    @State var attackStrength: Int?
    @State var game: Game = randomGame()
    @State var errors: [String] = []
    
    var body: some View {
        Text("Ajouter un loot")
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $game) {
                    ForEach(availableGames, id: \.self) { game in
                        Text(game.name.capitalized)
                            .tag(game)
                    }
                }
                Stepper(value: $quantity, in: 1...100) {
                    Text("Quantité : \(quantity)")
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    HStack() {
                        Text("Type : ")
                        Spacer()
                        Text(type.getLogo())
                    }
                }
                Picker("Type", selection: $type) {
                    ForEach(ItemType.allCases, id: \.self) { selectedType in
                        Text(selectedType.getLogo())
                            .tag(selectedType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }
            
            Section {
                Toggle(isOn: $isAttack) {
                    Text("Item d'attaque ?")
                }
                if isAttack {
                    Stepper("Force d'attaque : \(attackStrength ?? 0)", value: Binding<Int>(
                        get: { self.attackStrength ?? 0 },
                        set: { self.attackStrength = $0 }
                    ), in: 0...100)
                }
            }

            Button(action: {
                addItem()
            }, label: {
                Text("Ajouter l'objet")
            })
        }
        
        FormAddItemErrorView(errors: self.$errors)
    }
    
    func addItem() {
    var errors: [String] = []
        if name.count < 3 {
            errors.append("Le nom doit contenir au moins 3 élements")
        }
        if name.isEmpty {
            errors.append("Le nom ne doit pas être vide")
        }
        if type == .unknown{
            errors.append("Le type ne doit pas être unknown")
        }
        if game == .emptyGame {
            errors.append("Le jeu ne doit pas être EmptyGame")
        }
        
        self.errors = errors
        if self.errors.count != 0 {
            print(self.errors)
            return
        }

        
        inventory.addItem(item: LootItem(
            quantity: quantity, 
            name: name,
            type: type,
            rarity: rarity,
            attackStrength: attackStrength,
            game: game
            )
        )
        dismiss()
    }
}

#Preview {
    AddItemView(name: "namePreview", rarity: .common, game: randomGame())
}
    
