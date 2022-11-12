//
//  ProfileAllConnectionsView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 11/11/22.
//

import SwiftUI

struct ProfileAllConnectionsView: View {
   
    private let model: [ReviewModel]
    //lista de ReviewModel - List
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init() {
        model = [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example1, ReviewModel.example2, ReviewModel.example3,ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example1, ReviewModel.example2, ReviewModel.example3,ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example1, ReviewModel.example2, ReviewModel.example3,ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example1, ReviewModel.example2, ReviewModel.example3]
    }
    
    var body: some View {
        ScrollView {
            VStack{
                HeaderView(headerTitle: "Conexões")
                    .padding(.bottom,32)
                LazyVGrid(columns: columns, spacing: 24){
                    ForEach(0..<model.count, id: \.self) {index in
                        let item = model[index]
                        SingleConnectionView(image: item.user.image, country: item.user.originCountry, name: item.user.name, username: item.user.username)
                    }
                }
            }
        }
    }
}

struct ProfileAllConnectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAllConnectionsView()
    }
}

private struct HeaderView: View {
    
    var headerTitle: String?
    
    var body: some View {
        ZStack (alignment: .center){
            //            NavigationLink(destination: Text("ssi"), label: {
            Button(action: {print("clicou")}, label: {
                HStack(spacing:4){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                    Text("Voltar")
                        .font(.appButtonText)
                    Spacer()
                }.foregroundColor(Color.appBlueButton)
            })
            
            Text(headerTitle ?? "")
                .font(.appTitle2)
        } .padding(.horizontal, AppConfig.safeAreaHorizontal)
    }
}
