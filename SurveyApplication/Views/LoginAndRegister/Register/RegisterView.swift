//
//  RegisterView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 19.11.2024.
//

import SwiftUI

struct RegisterView: View {
    var loginAction: () -> Void
    @State private var selectedGender: GenderType = .none
    @State private var email: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var birthDate: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack{
                Text("Cinsiyet Seçiniz")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }.padding(.top, 10)
            
            HStack(spacing: 30) {
                Button(action: {
                    selectedGender = .female
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(selectedGender == .female ? .blue : .white)
                            .frame(width: 112, height: 42)
                        
                        Text("Kadın").foregroundColor(selectedGender == .female ? .white : .black)
                            .font(.system(size: 14))
                    }
                })
                
                Button(action: {
                    selectedGender = .male
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(selectedGender == .male ? .blue : .white)
                            .frame(width: 112, height: 42)
                        
                        Text("Erkek").foregroundColor(selectedGender == .male ? .white : .black)
                            .font(.system(size: 14))
                    }
                })
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                TextField("", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .frame(maxWidth: 245)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Nickname")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                TextField("", text: $nickname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Gizliliğinizi önemsiyoruz lütfen ad ve soyad girmeden nickname oluşturunuz.")
                    .font(.system(size: 9))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: 245)
            
            passwordSection.padding(.top, 5)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Doğum Tarihi")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                TextField("", text: $birthDate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .frame(maxWidth: 245)
            
            Button(action: {
                // İLERLE Butonu Aksiyonu
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.blue)
                        .frame(width: 165, height: 40)
                    
                    Text("İLERLE")
                        .background(Color.blue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
            }.padding(.top, 12)
            
            HStack {
                Spacer()
                Text("Hesabınız Var Mı?")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Button(action: loginAction) {
                    Text("Giriş Yap")
                        .font(.system(size: 12))
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            
            Spacer()
        }
    }
    
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
        }
        .frame(maxWidth: 245)
    }
}



#Preview {
    RegisterView {
        print("Login Action Triggered")
    }
}

enum GenderType: String, CaseIterable, Identifiable {
    case male, female, none
    
    var id: Self { self }
}
