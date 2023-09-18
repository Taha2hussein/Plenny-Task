//
//  SwiftUI-MVVM-C.swift
//  Plenny
//
//  Created by Taha Hussein on 18/09/2023.
//


import Combine

extension Publisher {
    func optionalize() -> Publishers.Map<Self, Self.Output?> {
        map({ Optional.some($0) })
    }
}
