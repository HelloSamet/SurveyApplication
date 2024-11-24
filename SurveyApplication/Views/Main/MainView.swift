//
//  MainView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 23.11.2024.
//

import SwiftUI

struct MainView: View {
    @State var selectedPage: mainViewPages = .home
    var body: some View {
        VStack {
            ZStack{
                switch selectedPage {
                case .home:
                    HomeView()
                case .survey:
                    SurveyView()
                case .profile:
                    ProfileView()
                }
            }
            HStack {
                // Sol Buton: Anket
                CustomTabButton(
                    imageName: "scribble.variable",
                    title: "Anket",
                    isSelected: selectedPage == .survey,
                    action: { selectedPage = .survey }
                )
                
                Spacer()
                
                // Ortadaki Buton: Ana Sayfa
                CustomCenterButton(
                    imageName: "house.fill",
                    isSelected: selectedPage == .home,
                    action: { selectedPage = .home }
                )
                
                Spacer()
                
                // Sağ Buton: Profil
                CustomTabButton(
                    imageName: "person.fill",
                    title: "Profil",
                    isSelected: selectedPage == .profile,
                    action: { selectedPage = .profile }
                )
            }
            .padding(.horizontal, 65)
            .background{
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: 340, height: 58)
            }
            Spacer().frame(height: 40)
        }
        .edgesIgnoringSafeArea(.all) // ZStack'i tüm alanı kapsat
        
    }
}

struct CustomCenterButton: View {
    let imageName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(isSelected ? Color.blue : Color.black)
                    .frame(width: 50, height: 50)
                
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundStyle(Color.white)
            }
        }
        .offset(y: -25) // Ortadaki buton yukarı taşınır
    }
}

struct CustomTabButton: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundStyle(isSelected ? Color.blue : Color.white)
                
                Text(title)
                    .font(.caption)
                    .foregroundStyle(isSelected ? Color.blue : Color.white)
            }
        }
    }
}



#Preview {
    MainView()
}

enum mainViewPages: String, CaseIterable, Identifiable {
    case survey
    case home
    case profile
    
    var id: Self { self }
}
