//
//  SettingsProfileRowView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 10/11/22.
//

import SwiftUI

struct SettingsProfileRowView: View {
    // MARK: - PROPERTIES

    var title: String
    var imageName: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    var body: some View {
        HStack{
            Text(title)
                .font(.appButtonText)
                .foregroundColor(.appBlack)
            Spacer()
            if imageName != "chevron.right" {
                Image(systemName: imageName ?? "xmark.app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.appBlueButton)
                    .frame(width: 13, height: 13)
            } else if (linkDestination != nil) {
                Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                Image(systemName: imageName ?? "chevron.right" )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.appBlueButton)
                    .frame(width: 13, height: 13)
            }
            else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct SettingsProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsProfileRowView(title: "BoraCast", imageName: "chevron.right", linkLabel: "", linkDestination: "www.google.com")
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
        }
    }
}
