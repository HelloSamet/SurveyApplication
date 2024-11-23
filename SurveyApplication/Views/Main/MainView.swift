//
//  MainView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 23.11.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                // Arka Plan Resmi
                Image("mainBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 425) // Resim yüksekliği
                    .clipped() // Çerçeve dışını kes
                
                // Alt Kısımdaki Beyaz Geçiş
                LinearGradient(
                    colors: [
                        Color.clear, // Transparan başlar
                        Color.white.opacity(0.8), // Yumuşak geçiş
                        Color.white // Tam beyaz
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 200) // Gradient yüksekliği
            }
            Spacer()
            Text("Merhaba ").font(.title3)
            +
            Text("Hellosamet").foregroundStyle(.blue)
                .font(.title3)
            
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: 178, height: 40)
                    Text("Ankete Başla").foregroundStyle(.white)
                        .font(.title3)
                }
            }).padding(.top, 35)
            Spacer().frame(height: 150)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                
                HStack{
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            Image(systemName: "scribble.variable").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                                .foregroundStyle(.white)
                            Text("Anket").font(.caption)
                                .foregroundStyle(.white)
                        }
                    })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            Circle()
                                .fill(Color.blue)
                            
                            Image(systemName: "house.fill").resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.white)
                                .frame(width: 25)
                        }
                        .frame(width: 50, height: 50)
                    }).offset(y: -25)
                    
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            Image(systemName: "person.fill").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                                .foregroundStyle(.white)
                            
                        Text("Profil").font(.caption)
                            .foregroundStyle(.white)
                        }
                    })
                }.padding(.horizontal, 65)
            }
            .frame(width: 340, height: 58)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all) // ZStack'i tüm alanı kapsat
    
    }
}

#Preview {
    MainView()
}
