//
//  Custom Button.swift
//  Plenny
//
//  Created by Taha Hussein on 18/09/2023.
//

import Foundation
import SwiftUI
struct CustomButton: View {
    var text: String?
    var icon: Image?
    var clicked: (() -> Void) // use closure for callback
    
    var body: some View {
        Button(action: clicked) { // call the closure here
            HStack {
                Text(text ?? "") // your text
                
                icon // your icon image
            }
            .foregroundColor(Color.white)
            .padding()
            .background(.blue)
            .cornerRadius(16)
        }
    }
}

struct Localization {
    static let login = "Log In"
    static let clicked = "Clicked!"
    static let Welcome = "Welcome"
    static let userName = "User Name"
    static let password = "Password"
    static let enterNameField = "Please enter your name"
    static let passwordField = "Please enter your password"
    static let loginViewImage = "Frame 9"
}
