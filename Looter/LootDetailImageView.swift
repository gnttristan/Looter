//
//  LootDetailListView.swift
//  Looter
//
//  Created by Tristan GINET on 1/23/24.
//

import Foundation
import SwiftUI


struct LootDetailImageView: View {
    var item: LootItem
    @State private var rotate: Bool = false
    @State private var shadowed: Bool = false
    @State private var onImageClick: Bool = false
    
    var body: some View {
        Section {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(item.rarity.getColor()))
                    .shadow(color: Color(item.rarity.getColor()), radius: shadowed ? 100 : 0)
                    .frame(width: onImageClick ? 250 : 150, height: onImageClick ? 250 : 150)
                    .overlay(
                        Text(item.type.getLogo())
                            .font(.system(size: 80))
                    )
                    .padding(.bottom, 20)
                    .rotation3DEffect(
                        Angle(degrees: rotate ? 0 : 360),
                        axis: (x: -1, y: -0.5, z: 0)
                    )
                    .onAppear() {
                        Task {
                            try await Task.sleep(nanoseconds: 400_000_000)
                            
                            withAnimation(Animation.linear) {
                                self.rotate.toggle()
                            }

                            try await Task.sleep(nanoseconds: 200_000_000)

                            withAnimation(Animation.linear) {
                                self.shadowed.toggle()
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation(Animation.bouncy(duration: 0.5)) {
                            self.onImageClick.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(Animation.bouncy(duration: 0.5)) {
                                    self.onImageClick.toggle()
                                }
                            }
                        }
                    }
                    .opacity(onImageClick ? /*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/ : 1)
                Text(item.name)
                    .font(.title)
                    .foregroundStyle(item.rarity.getColor())
                    .bold()
                }
            
            if item.rarity == .unique {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(item.rarity.getColor()))
                    .frame(width: 350, height: 50)
                    .shadow(color: Color(item.rarity.getColor()), radius: 40)
                    .overlay(
                        Text("Objet Unique 🏆")
                            .font(.headline)
                            .foregroundColor(.white)
                    )
                }
            }
        
        .padding(.top, 15)
        .padding(.bottom, 15)
    }
}

