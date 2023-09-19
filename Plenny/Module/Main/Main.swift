//
//  Main.swift
//  Plenny
//
//  Created by Taha Hussein on 19/09/2023.
//

import Foundation
import SwiftUI

struct Main: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        Text("fffff")
        
        CustomButton (
            text: Localization.login
        ) {
            self.coordinator.pop()
//                    viewModel.login(username: userName, password: password)
        }
    }
}
