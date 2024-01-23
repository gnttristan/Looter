//
//  LootDetailListView.swift
//  Looter
//
//  Created by Tristan GINET on 1/23/24.
//

import Foundation
import SwiftUI


struct LootDetailListView: View {
    @State var item: LootItem
    
    var body: some View {
          List{
              Section {
                  HStack(){
                      Section() {
                          if let coverImage = UIImage(named: item.game.coverName!)  {
                              Image(item.game.coverName!)
                                  .resizable()
                                  .frame(width: 58, height: 58)
                                  .aspectRatio(contentMode: .fit)
                                  .cornerRadius(4)
                          }
                          else {
                              RoundedRectangle(cornerRadius: 4)
                                  .fill(Color.gray.opacity(0.4))
                                  .frame(width: 40, height: 58)
                                  .foregroundColor(.black)
                                  .opacity(0.4)
                                  .background(
                                      Image(systemName: "rectangle.slash")
                                          .aspectRatio(contentMode: .fit)
                                  )
                          }
                          Text(item.game.name)
                      }
                      
                  }
                  Text("In-game: \(item.game.name)")

                  Text("Puissance (AQT): \(String(describing: item.attackStrength))")
                  Text("Possédé(s): \(item.quantity)")
                  Text("Rareté: \(String(describing: item.rarity))")
              }
          header: {
              Text("INFORMATIONS")
          }
          }
          .background(Color(UIColor.red))
          .padding(.bottom, 15)
    }
}
