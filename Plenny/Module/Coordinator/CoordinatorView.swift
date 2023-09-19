//
//  CoordinatorView.swift
//  Plenny
//
//  Created by Taha Hussein on 19/09/2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = Coordinator()
    var body: some View {
        
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .login)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreen) { fullScreen in
                    coordinator.build(fullScreen: fullScreen)
                }
        }.environmentObject(coordinator)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
