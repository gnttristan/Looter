//
//  LootDetailView.swift
//  Looter
//
//  Created by Tristan GINET on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem
    
    var body: some View {
        LootDetailImageView(item: item)
        LootDetailListView(item: item)
    }
}

#Preview {
    LootDetailView(item: items[5])
}
