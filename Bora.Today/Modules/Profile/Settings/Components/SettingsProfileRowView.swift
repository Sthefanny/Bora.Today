//
//  SettingsProfileRowView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 10/11/22.
//

import SwiftUI

struct SettingsProfileRowView: View {
    // MARK: - PROPERTIES
    
    var settingsRowType: SettingsRowType
    
    let imageName: String = "chevron.right"
    
    var title: String
    var titleColor: Color? = .appBlack
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    // MARK: - BODY
    var body: some View {
        HStack{
            switch settingsRowType {
                // MARK: - ONLY TITLE
            case .onlyTitle:
                Link(destination: URL(string: "https://\(linkDestination!)")!) {
                    Text(title)
                        .font(.appButtonText)
                        .foregroundColor(titleColor!)
                }
                Spacer()
                
                
                // MARK: - ONLY IMAGE
            case .onlyImage:
                Text(title)
                    .font(.appButtonText)
                    .foregroundColor(.appBlack)
                Spacer()
                Link(destination: URL(string: "https://\(linkDestination!)")!) {
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.appBlueButton)
                        .frame(width: 13, height: 13)
                }
                
                // MARK: - ONLY TEXT
            case .onlyText:
                Text(title)
                    .font(.appButtonText)
                    .foregroundColor(.appBlack)
                Spacer()
                Button(action: {print("action!")}, label: {
                    Text(linkLabel ?? "")
                        .font(.appSubheadline)
                        .foregroundColor(.appBlueButton)
                })
                
                // MARK: - TEXT AND IMAGE
            case .textAndImage:
                Text(title)
                    .font(.appButtonText)
                    .foregroundColor(.appBlack)
                Spacer()
                Link(destination: URL(string: "https://\(linkDestination!)")!) {
                    HStack(spacing:4) {
                        Text(linkLabel ?? "")
                            .font(.appSubheadline)
                            .foregroundColor(.appBlueButton)
                        Image(systemName: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.appBlueButton)
                            .frame(width: 13, height: 13)
                    }
                }
            }
        }
    }
}

struct SettingsProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsProfileRowView(settingsRowType: .onlyTitle, title: "BoraCast", titleColor: .appBlueButton, linkDestination: "www.google.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsProfileRowView(settingsRowType: .onlyImage, title: "BoraCast", linkDestination: "www.google.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsProfileRowView(settingsRowType: .onlyText, title: "BoraCast", linkLabel: "Português", linkDestination: "www.google.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsProfileRowView(settingsRowType: .textAndImage, title: "BoraCast", linkLabel: "Português", linkDestination: "www.google.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
