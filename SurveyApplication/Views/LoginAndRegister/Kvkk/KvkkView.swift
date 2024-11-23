//
//  KvkkView.swift
//  SurveyApplication
//
//  Created by Abdulsamet Göçmen on 20.11.2024.
//

import SwiftUI

struct KvkkView: View {
    @StateObject var viewModel: RegisterViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            headerSection
            toggleSections
            loginButton
        }
        .padding(.horizontal, 24)
    }
}

// MARK: - Components
extension KvkkView {
    // Üst Bilgilendirme Bölümü
    private var headerSection: some View {
        VStack(spacing: 10) {
            Text("Hassas Veriler Hakkında")
                .font(.headline)
            Text("""
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                """)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
    }
    
    // Toggle Listesi
    private var toggleSections: some View {
        VStack(spacing: 30) {
            toggleRow(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", isOn: $viewModel.toggleField1)
            toggleRow(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isOn: $viewModel.toggleField2)
            toggleRow(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isOn: $viewModel.toggleField3)
        }
    }
    
    // Tek Bir Toggle Satırı
    private func toggleRow(text: String, isOn: Binding<Bool>) -> some View {
        HStack(alignment: .top, spacing: 16) {
            Toggle("", isOn: isOn)
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .blue))
            Text(text)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
    
    // İlerle Butonu
    private var loginButton: some View {
        Button(action: {
            viewModel.register()
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
        .padding(.top, 20)
    }
}
#Preview {
    KvkkView(viewModel: RegisterViewModel())
}
