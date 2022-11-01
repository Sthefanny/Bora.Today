//
//  CreateUsersListView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 27/10/22.
//

import SwiftUI
import SwiftFlags

struct CreateUsersListView: View {
    private let model: [ReviewModel]
    //lista de ReviewModel - List
    
    init() {
        model = [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example1, ReviewModel.example2, ReviewModel.example3]
    
    }
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<model.count) {index in
                    let item = model[index]
                    ProfileImageView(image: item.user.image, country: item.user.originCountry)
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
