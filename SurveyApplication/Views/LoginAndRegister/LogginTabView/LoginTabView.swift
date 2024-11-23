//
//  LoginTabView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 19.11.2024.
//

import SwiftUI

struct LoginTabView: View {
    @StateObject private var viewModel = LoginTabViewModel()
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var registerViewModel = RegisterViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Arka Plan Resmi
            backgroundImage
            
            VStack {
                Spacer().frame(height: 300)
                
                ZStack {
                    backgroundCard
                    content
                }
                .frame(height: 550)
            }
        }
        .fullScreenCover(isPresented: shouldShowFullScreen) {
            // Gösterilecek tam ekran içerik
            MainView()
        }
    }
}

private extension LoginTabView {
    // Arka Plan Resmi
    var backgroundImage: some View {
        Image("loginBackground")
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
    
    // Arka Plan Kartı
    var backgroundCard: some View {
        RoundedRectangle(cornerRadius: 45)
            .fill(Color.white.opacity(0.8))
    }
    
    // İçerik
    var content: some View {
        VStack(spacing: 16) {
            dragIndicator
                .padding(.top, 12)
            
            TabView(selection: $viewModel.pageIndex) {
                loginOrRegisterView.tag(0)
                KvkkView(viewModel: registerViewModel).tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            bottomBar
                .padding(.bottom, 12)
            
            Spacer()
        }
    }
    
    // Login veya Register Görünümü
    var loginOrRegisterView: some View {
        Group {
            if viewModel.openRegisterView {
                RegisterView(
                    viewModel: registerViewModel,
                    loginAction: { viewModel.openRegisterView = false },
                    continueAction: { viewModel.pageIndex = 1 }
                )
            } else {
                LoginView(
                    viewModel: loginViewModel,
                    registerAction: { viewModel.openRegisterView = true },
                    forgotPasswordAction: {}
                )
            }
        }
    }
    
    // FullScreenCover için Binding
    var shouldShowFullScreen: Binding<Bool> {
        Binding(
            get: { registerViewModel.isRegistering || loginViewModel.isLoggedIn },
            set: { newValue in
                if !newValue {
                    registerViewModel.isRegistering = false
                    loginViewModel.isLoggedIn = false
                }
            }
        )
    }
}


#Preview {
    LoginTabView()
}

// MARK: - Alt Bileşenler
extension LoginTabView {
    /// Çekme Göstergesi
    private var dragIndicator: some View {
        Rectangle()
            .frame(width: 25, height: 3)
            .cornerRadius(12)
            .foregroundColor(.gray)
    }
    
    /// Alt Sekme Göstergesi
    private var bottomBar: some View {
        HStack(spacing: 8) {
            ForEach(0..<2) { index in
                Rectangle()
                    .frame(width: viewModel.pageIndex == index ? 12 : 8, height: 5)
                    .cornerRadius(10)
                    .foregroundStyle(viewModel.pageIndex == index ? .blue : .gray)
                    .animation(.easeInOut, value: viewModel.pageIndex)
            }
        }
    }
}
