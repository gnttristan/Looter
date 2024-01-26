import SwiftUI
import Charts

class Inventory: ObservableObject {
    @Published var loot = items
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
    
    @State var showAddItemView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot, id: \.self) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        LootRowView(item: item)
                    }
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView()
                    .environmentObject(inventory)
            })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
            .toolbar(content: { // La barre d'outil de notre page
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle() // L'action de notre bouton
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
                ToolbarItem {
                    Button(action: {
                        isOnboardingDone = false
                    }, label: {
                        Image(systemName: "xmark.square.fill")
                    })
                }
            })
        }
        Chart{
            ForEach(inventory.loot, id: \.self) { item in
                BarMark(
                    x: .value("Arme",item.name),
                    y: .value("Force",item.attackStrength ?? 0)
                )
            }
        }
        .frame(height: 200)	
    }
}

//#Preview {
//    ContentView()
//}
