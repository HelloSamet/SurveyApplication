//
//  LoginViewModel.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 20.11.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var nickName: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
}
