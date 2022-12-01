//
//  ProfileAllConnectionsView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 11/11/22.
//

import SwiftUI

struct ProfileAllConnectionsView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    private let model: [ReviewModel]
    //lista de ReviewModel - List
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init() {
        model = [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example4, ReviewModel.example5, ReviewModel.example6,ReviewModel.example7]
    }
    
    var body: some View {
        VStack{
            HeaderView(headerTitle: "Conexões")
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 24){
                    ForEach(0..<model.count, id: \.self) {index in
                        let item = model[index]
                        SingleConnectionView(model: item.user)
                    }
                }
                .padding(.top, 32)
            }
        }
        .padding(.horizontal, 21)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ProfileAllConnectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAllConnectionsView()
    }
}
