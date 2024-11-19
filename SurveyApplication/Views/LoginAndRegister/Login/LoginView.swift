//
//  LoginView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 18.11.2024.
//

import SwiftUI

struct LoginView: View {
    @Binding var pageIndex: Int
    var loginAction: () -> Void
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
            
            TextField("", text: .constant(""))
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
            
            SecureField("", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: false ? "eye" : "eye.slash").resizable()
                                .foregroundColor(.gray)
                                .frame(width: 14, height: 12)
                                
                        }
                        .padding(.trailing, 12)
                    }
                )
            
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
        Button(action: {}) {
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
            
            Button(action: {}) {
                Text("Hesap Oluştur")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    LoginView(pageIndex: .constant(0), loginAction: {
        
    }, registerAction: {
        
    }, forgotPasswordAction: {
        
    })
}

