//
//  CreateUsersListView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 27/10/22.
//

import SwiftUI
import SwiftFlags

//por algum motivo quebrou - não tá gerando imagens diferentes
    //Tem que pegar do perfil da pessoa

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
                    ProfileImageView()
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
