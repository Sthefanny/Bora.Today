//
//  CreateExperienceCornerButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 07/11/22.
//

import SwiftUI

struct CreateExperienceCornerButton: View {
    
    var text: String
    var icon: String
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        
        NavigationLink(destination: CreateView(shouldShowBack: true)) {
            VStack {
                Image(icon)
                Text(text)
                    .font(.appButtonText)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 119, height: 119)
            .foregroundColor(.appWhite)
            .tint(Color.appBlueButton)
            .cornerRadius(18)
            .foregroundColor(.appButtonWhiteContent)
            .background(RoundedRectangle(cornerRadius: 5)
                .fill(Color.appBlueButton))
            .cornerRadius(30)
            .tint(Color.appBlueButton)
        }
    }
}

struct CreateExperienceCornerButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateExperienceCornerButton(text: "Create Experience", icon: "createIcon2")
    }
}
