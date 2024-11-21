//
//  LoginTabView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 19.11.2024.
//

import SwiftUI

struct LoginTabView: View {
    @StateObject private var viewModel = LoginTabViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Arka Plan Resmi
            Image("loginBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer().frame(height: 300)
                ZStack{
                    RoundedRectangle(cornerRadius: 45)
                        .fill(Color.white.opacity(0.8))
                    
                    VStack(spacing: 16) {
                        dragIndicator
                            .padding(.top, 12)
                        
                        TabView(selection: $viewModel.pageIndex) {
                            // Giriş Yap Sekmesi
                            ZStack{
                                if viewModel.openRegisterView {
                                    RegisterView(loginAction: {
                                        viewModel.openRegisterView = false
                                    }, continueAction: {
                                        viewModel.pageIndex = 1
                                    })
                                }
                                else{
                                    LoginView(registerAction:
                                        {
                                            viewModel.openRegisterView = true
                                        },
                                        forgotPasswordAction:
                                        {
                                            
                                        }
                                    )
                                }
                            }
                            .tag(0)
                            
                            KvkkView().tag(1)
                            
                        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        bottomBar
                            .padding(.bottom, 12)
                        
                        Spacer()
                    }
                }
                .frame(height: 550)
            }
        }
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
            ForEach(0..<3) { index in
                Rectangle()
                    .frame(width: viewModel.pageIndex == index ? 12 : 8, height: 5)
                    .cornerRadius(10)
                    .foregroundStyle(viewModel.pageIndex == index ? .blue : .gray)
                    .animation(.easeInOut, value: viewModel.pageIndex)
            }
        }
    }
}
