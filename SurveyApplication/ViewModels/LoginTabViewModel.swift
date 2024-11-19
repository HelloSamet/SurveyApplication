//
//  LoginTabViewModel.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 19.11.2024.
//

import Foundation

class LoginTabViewModel: ObservableObject {
    @Published var pageIndex: Int = 0
    
    @Published var openRegisterView: Bool = false
    
}
