//
//  CreateUsersListView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 27/10/22.
//

import SwiftUI
import SwiftFlags

struct CreateUsersListView: View {
    private let model: [UserModel]
    
    init() {
        model = [UserModel.example1, UserModel.example2, UserModel.example3, UserModel.example1, UserModel.example2, UserModel.example3]
    
    }
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<model.count) {index in
                    let item = model[index]
                    NavigationLink(destination: ProfileView(isSelfProfile: false, model: item, shouldShowBack: true)) {
                        ProfileImageView(model: item)
                    }
                }
            }
            .padding(.leading, 21)
        }
        
    }
}


struct CreateUsersListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsersListView()
    }
}
