//
//  LoginView.swift
//  Plenny
//
//  Created by Taha Hussein on 18/09/2023.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var userName: String = ""
    @State var password: String = ""
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                Image(Localization.loginViewImage)
                    .resizable()
                    .frame(height: geo.size.height * 0.6)
                
                Text(Localization.Welcome)
                    .foregroundColor(.blue)
                    .bold()
                
                AuthenticationView(userName: $userName , password: $password)
                
                CustomButton (
                    text: Localization.login
                ) {
                    viewModel.login(username: userName, password: password)
                }.onReceive(viewModel.$loginSucessful) { loginSucess in
                    if loginSucess {
                        self.coordinator.push(page: .home)
                    }
                }
             
            }
        }.ignoresSafeArea()
    }
}

struct AuthenticationView: View {
    @Binding var userName: String
    @Binding var password: String
    // we can make it generic text field by setting all attributes we want .. but i for now added staatic view
    var body: some View {
        VStack(alignment: .leading) {
            Text(Localization.userName)
            TextField(Localization.enterNameField, text: $userName)
                .font(.caption2)
                .frame(height: 30.0)
                .border(.black,width: 0.2)
                .cornerRadius(5.0)
            Text(Localization.password)
            TextField(Localization.passwordField, text: $password)
                .font(.caption2)
                .frame(height: 30.0)
                .border(.black,width: 0.2)
                .cornerRadius(5.0)
            
        }.padding(.leading)
    }
}

