//
//  RegisterViewModel.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 20.11.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var selectedGender: GenderType = .none
    @Published var email: String = ""
    @Published var nickname: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var birthDate: String = ""
    
    @Published var toggleField1: Bool = false
    @Published var toggleField2: Bool = false
    @Published var toggleField3: Bool = false
    
    @Published var isRegistering: Bool = false
    
    func register() {
        isRegistering = true
    }
}
