//
//  OnboardingView.swift
//  Looter
//
//  Created by Tristan GINET on 1/26/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            OnboardingPageView(
                titre: "Gérer ses loots",
                image: "gym.bag.fill",
                description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle",
                buttonString: ButtonType.next,
                buttonAction: { selectedTab = 1 },
                backgroundColor: Color.blue
            ).tag(0)
        
            OnboardingPageView(
                titre: "Votre wishlist",
                image: "wand.and.stars",
                description: "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir",
                buttonString: ButtonType.next,
                buttonAction: {
                    selectedTab = 2
                },
                backgroundColor: Color.purple
            ).tag(1)
        
            OnboardingPageView(
                titre: "En un coup d'wand.and.starsoeil",
                image: "iphone.case",
                description: "Accédez facilemenet à vos fonctionnalités cléfs depuis l'écran d'accueil de l'application",
                buttonString: ButtonType.start,
                buttonAction: {
                    isOnboardingDone = true
                },
                backgroundColor: Color.yellow
            ).tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

//#Preview {
//    OnboardingView(isOnboardingDone: Binding<Bool>)
//}
