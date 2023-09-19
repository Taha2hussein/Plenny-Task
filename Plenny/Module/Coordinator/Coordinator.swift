//
//  Coordinator.swift
//  Plenny
//
//  Created by Taha Hussein on 19/09/2023.
//

import Foundation
import SwiftUI


/// i createde simple coordinator which can make it advanced
enum Page: String, Identifiable {
    case login, home, search
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable{
    case sheet
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable{
    case fullScreen
    
    var id: String {
        self.rawValue
    }
}


class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreen: FullScreenCover?
    
    func push(page: Page) {
        path.append(page)
    }

    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func fullScreenCover(screenCover: FullScreenCover) {
        self.fullScreen = screenCover
    }
    
    func pop(){
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreen = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .login:
            LoginView()
        case .home:
            Main()
        case .search:
            Main()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .sheet:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(fullScreen: FullScreenCover) -> some View {
        switch fullScreen {
        case .fullScreen:
            EmptyView()
        }
    }
}
