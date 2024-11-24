//
//  HomeView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 24.11.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
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
        }
    }
}

#Preview {
    HomeView()
}
