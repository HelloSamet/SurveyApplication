//
//  RegisterView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 19.11.2024.
//

import SwiftUI

struct RegisterView: View {
    var loginAction: () -> Void
    var continueAction: () -> Void
    @State private var selectedGender: GenderType = .none
    @State private var email: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var birthDate: String = ""

    var body: some View {
        VStack(spacing: 8) {
            genderSelection
            emailSection
            nicknameSection
            passwordSection
            birthDateSection
            registerButton
            loginPrompt
            Spacer()
        }
    }
}

// MARK: - Alt Bileşenler
extension RegisterView {
    
    // Cinsiyet Seçimi
    private var genderSelection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Cinsiyet Seçiniz")
                .font(.system(size: 12))
                .foregroundColor(.black)
            
            HStack(spacing: 30) {
                genderButton(title: "Kadın", isSelected: selectedGender == .female) {
                    selectedGender = .female
                }
                genderButton(title: "Erkek", isSelected: selectedGender == .male) {
                    selectedGender = .male
                }
            }
        }
        .frame(maxWidth: 245)
    }
    
    private func genderButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color.blue : Color.white)
                    .frame(width: 112, height: 42)
                Text(title)
                    .foregroundColor(isSelected ? .white : .black)
                    .font(.system(size: 14))
            }
        }
    }
    
    // Email Girişi
    private var emailSection: some View {
        formField(title: "Email", text: $email)
    }
    
    // Nickname Girişi
    private var nicknameSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            formField(title: "Nickname", text: $nickname)
            
            Text("Gizliliğinizi önemsiyoruz, lütfen ad ve soyad girmeden nickname oluşturunuz.")
                .font(.system(size: 9))
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
            
            SecureField("", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: false ? "eye" : "eye.slash")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 14, height: 12)
                        }
                        .padding(.trailing, 12)
                    }
                )
        }
        .frame(maxWidth: 245)
    }
    
    // Doğum Tarihi Girişi
    private var birthDateSection: some View {
        formField(title: "Doğum Tarihi", text: $birthDate)
    }
    
    // Form Alanı
    private func formField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.black)
            
            TextField("", text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .frame(maxWidth: 245)
    }
    
    // Kayıt Ol Butonu
    private var registerButton: some View {
        Button(action: {
            // Kayıt Aksiyonu
            continueAction()
        }) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 134, height: 40)
                .overlay(
                    Text("İlerle")
                        .foregroundColor(.white)
                        .font(.body)
                )
        }
        .padding(.top, 16)
    }
    
    // Giriş Yap Kısmı
    private var loginPrompt: some View {
        HStack(spacing: 4) {
            Text("Hesabınız var mı?")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            Button(action: loginAction) {
                Text("Giriş Yap")
                    .font(.system(size: 12))
                    .foregroundColor(.blue)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    RegisterView(loginAction: {
        print("Login Action Triggered")
    }, continueAction: {
        print("Register Action Triggered")
    })
}

// MARK: - GenderType Enum
enum GenderType: String, CaseIterable, Identifiable {
    case male, female, none
    
    var id: Self { self }
}
