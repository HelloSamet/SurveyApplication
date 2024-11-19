//
//  LoginRouter.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 19.11.2024.
//

import Foundation
import SwiftUI

@Observable
class LoginRouter {
    var navPath = NavigationPath()
    
    public enum Destination: Codable, Hashable {
        case login
        case register
        case forgotPassword
    }
    

    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
