//
//  LoginView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 18.11.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    var registerAction: () -> Void
    var forgotPasswordAction: () -> Void
    var body: some View {
        VStack(spacing: 20) {
            welcomeText
            nicknameSection
            passwordSection
            loginButton
            registerPrompt
            Spacer()
            
        }
    }
}

// MARK: - Alt Bileşenler
extension LoginView {
    
    // Hoşgeldiniz Yazısı
    private var welcomeText: some View {
        Text("Hoşgeldiniz")
            .font(.headline)
            .foregroundColor(.black)
            .padding(.vertical, 12)
    }
    
    // Nickname Girişi
    private var nicknameSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Nickname")
                .font(.subheadline)
                .foregroundColor(.black)
            
            TextField("", text: $viewModel.nickName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Gizliliğinizi önemsiyoruz lütfen ad ve soyad girmeden nickname oluşturunuz.")
                .font(.caption2)
                .foregroundColor(.black)
        }
        .frame(maxWidth: 245)
    }
    
    // Şifre Girişi
    private var passwordSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Şifre")
                .font(.subheadline)
                .foregroundColor(.black)
            
            ZStack {
                if viewModel.showPassword {
                    TextField("", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                else
                {
                    SecureField("", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
            }.overlay{
                HStack{
                    Spacer()
                    Image(systemName: viewModel.showPassword ? "eye" : "eye.slash")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 13, height: 11)
                        .onTapGesture {
                            viewModel.showPassword.toggle()
                        }
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10)
                }
            }
            
            HStack {
                Spacer()
                Button(action: {forgotPasswordAction()}) {
                    Text("Şifremi unuttum")
                        .font(.caption2)
                        .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: 245)
    }
    
    // Giriş Yap Butonu
    private var loginButton: some View {
        Button(action: {
            viewModel.login()
        }) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 134, height: 40)
                .overlay(
                    Text("Giriş Yap")
                        .foregroundColor(.white)
                        .font(.body)
                )
        }
        .padding(.top, 16)
    }
    
    // Hesap Oluştur Kısmı
    private var registerPrompt: some View {
        HStack(spacing: 4) {
            Text("Üye değil misiniz?")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Button(action: {registerAction()}) {
                Text("Hesap Oluştur")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    LoginView(viewModel: LoginViewModel(), registerAction: {
        
    }, forgotPasswordAction: {
        
    })
}

