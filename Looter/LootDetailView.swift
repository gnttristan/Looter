//
//  LootDetailView.swift
//  Looter
//
//  Created by Tristan GINET on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    @EnvironmentObject var inventory: Inventory
    
    var body: some View {
        NavigationStack {
            LootDetailImageView(item: item)
            LootDetailListView(item: item)
        }.navigationBarItems(trailing: NavigationLink(destination: EditItemView(
            name: item.name,
            type: item.type,
            rarity: item.rarity,
            quantity: item.quantity,
            isAttack: item.attackStrength != nil,
            attackStrength: item.attackStrength,
            game: item.game,
            editAction: EditItemView.EditAction.edit,
            idToEdit: item.id
        ).environmentObject(inventory)
        ) {
            Text("Edit")
        })
    }
}

//#Preview {
//    LootDetailView(item: items[5])
//}
