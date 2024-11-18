//
//  LoginView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 18.11.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            Image("loginBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer().frame(height: 290)
                ZStack{
                    RoundedRectangle(cornerRadius: 45)
                        .fill(Color.white.opacity(0.75))
                        .frame(height: 550)
                    
                    VStack{
                        Rectangle().frame(width: 25, height: 3)
                            .foregroundStyle(Color.gray)
                        
                        Text("Hoşgeldiniz").font(.system(size: 20))
                            .padding(.top, 57)
                        
                        VStack(alignment: .leading){
                            Text("Nickname").font(.system(size: 12))
                            TextField("", text: .constant("")).textFieldStyle(.roundedBorder)
                                
                            Text("Gizliliğinizi önemsiyoruz lütfen ad ve soyad girmeden nickname oluşturunuz.").font(.system(size: 8))
                        }.frame(width: 245)
                            .padding(.top, 57)
                        
                        VStack(alignment: .leading){
                            Text("Şifre").font(.system(size: 12))
                            TextField("", text: .constant("")).textFieldStyle(.roundedBorder)
                                .overlay(content: {
                                    HStack{
                                        Spacer()
                                        Button(action: {}) {
                                            Image(systemName: "eye.slash.fill").resizable()
                                                .frame(width: 14, height: 12)
                                                .foregroundStyle(.gray)
                                        }
                                    }.padding(.all, 10)
                                })
                                
                            HStack{
                                Spacer()
                                Text("Şifremi unuttum").font(.system(size: 8))
                            }
                        }.frame(width: 245)
                            .padding(.top, 20)
                        
                        Button(action: {
                            
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(Color.blue)
                                
                                Text("Giriş Yap").font(.system(size: 14))
                                    .foregroundStyle(.white)
                            }.frame(width: 134, height: 40)
                        }.padding(.top, 57)
                        
                        HStack{
                            Text("Üye değil misiniz?")
                            Button(action: {}) {
                                Text("Hesap Oluştur")
                            }
                        }.font(.system(size: 12))
                            .padding(.top, 14)
                        
                    Spacer()
                    }.padding(.all, 12)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
