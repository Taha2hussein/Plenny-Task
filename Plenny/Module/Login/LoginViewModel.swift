//
//  LoginViewModel.swift
//  Plenny
//
//  Created by Taha Hussein on 18/09/2023.
//

import Foundation
import SwiftUI
class LoginViewModel: ObservableObject {
    
    @EnvironmentObject  var coordinator: Coordinator
    @Published var loginResponse: LoginModel?
    @Published var token = String()
    @Published var loginSucessful: Bool = false
    private var disposal = Disposal()
    let repositry: Repository

    init(repositryMock: Repository = Repository()) {
        self.repositry = repositryMock
        bind()
    }
    
    // add static value because keyboard not show in simulator
    func login(username: String?, password: String?) {
        repositry.login(username: "kminchelle", password: "0lelplR").observe { result, _ in
            guard let result = result else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let resoinse):
                    self.loginResponse = resoinse
                    self.loginSucessful = true
                case .failure(let error):
                    print(error)
                }
            }
        }.add(to: &disposal)
    }
    
    func bind() {
        $loginResponse.map({ ($0?.token ?? "") }).assign(to: &$token)
    }
}
