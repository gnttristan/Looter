//
//  FormAddItemError.swift
//  Looter
//
//  Created by Tristan GINET on 1/23/24.
//

import Foundation
import SwiftUI

struct FormAddItemErrorView: View {
    @Binding var errors: [String]
    
    var body: some View {
        if !errors.isEmpty {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.red)
                .overlay(
                    VStack {
                        ForEach(errors, id: \.self) { error in
                            Text("\(error)")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                )
                .padding()
                .frame(height: 130)
        }
    }
}

