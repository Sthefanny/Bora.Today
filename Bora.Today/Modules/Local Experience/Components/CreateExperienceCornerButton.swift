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
    
    @State private var goesToCreateExperience: Bool = false
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        VStack {
            Image(icon)
            Text(text)
                .font(.appButtonText)
                .multilineTextAlignment(.center)
            
            NavigationLink(destination: CreateView(), isActive: $goesToCreateExperience) {}
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
        .onTapGesture {
            self.goesToCreateExperience = true
        }
    }
}

struct CreateExperienceCornerButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateExperienceCornerButton(text: "Create Experience", icon: "createIcon2")
    }
}
