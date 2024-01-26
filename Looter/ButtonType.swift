//
//  ButtonType.swift
//  Looter
//
//  Created by Tristan GINET on 1/26/24.
//

import Foundation
import SwiftUI

enum ButtonType {
    case next
    case start

    var buttonText: String {
        switch self {
        case .next:
            return "Suivant"
        case .start:
            return "Commencer"
        }
    }
}
