//
//  View+ Extension.swift
//  Plenny
//
//  Created by Taha Hussein on 19/09/2023.
//

import Foundation
import SwiftUI
enum FrameAlignment {
    case top,bottom,leading,trailing
}

extension View {
    @ViewBuilder
    func setAlignment(frameAlignment: FrameAlignment) -> some View {
        switch frameAlignment {
        case .leading:
            self.frame(maxWidth: .infinity, alignment: .leading )
        case .trailing:
            self.frame(maxWidth: .infinity, alignment: .trailing )
        case .top:
            self.frame(maxWidth: .infinity, alignment: .top )
        case .bottom:
            self.frame(maxWidth: .infinity, alignment: .bottom )
        }
    }
}
