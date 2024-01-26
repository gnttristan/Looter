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
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(30)
                .background(Circle().fill(backgroundColor))
                .foregroundColor(.white)
            Text(description)
                .font(.body)
                .padding(30)
            Button(action: {
                buttonAction()
            }) {
                Text(buttonString.buttonText)
            }   .padding()
                .frame(width: 250, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

//#Preview {
//    OnboardingPageView()
//}
