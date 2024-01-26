//
//  OnboardingPageView.swift
//  Looter
//
//  Created by Tristan GINET on 1/26/24.
//

import SwiftUI

struct OnboardingPageView: View {
    @State var titre: String
    @State var image: String
    @State var description: String
    @State var buttonString: ButtonType
    @State var buttonAction: () -> Void
    @State var backgroundColor: Color
    
    var body: some View {
        VStack() {
            Text(titre)
                .bold()
                .font(.largeTitle)
            Image(image)
                .resizable()
                .background(backgroundColor)
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
            Text(description)
            Button(action: {
                buttonAction()
            }) {
                Text(buttonString.buttonText)
            }
        }
    }
}

//#Preview {
//    OnboardingPageView()
//}
