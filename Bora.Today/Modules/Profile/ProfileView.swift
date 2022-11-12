//
//  ProfilePublicView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 07/11/22.
//

import SwiftUI

struct ProfileView: View {
    
    // true se for privado
    // false se for público
    @State var isModelView : Bool
    @State var halfButtonHeight: CGFloat = 35/2
    
    @State var backgroundPrivateColor: Color = .appYellow
    var backgroundPublicColor: Color = .appPink
    
    let model : UserModel
    
    var body: some View {
        GeometryReader { outerscreen in
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    ZStack{
                        if isModelView == true {
                            backgroundPrivateColor
                                .edgesIgnoringSafeArea(.top)
//                                .frame(height: outerscreen.size.height * 0.35)
                        } else {
                            backgroundPublicColor
                                .edgesIgnoringSafeArea(.top)
//                                .frame(height: outerscreen.size.height * 0.32) // valor antigo (sem geometry readers)
                        }
                        ProfileHeaderView(isModelView: $isModelView, halfButtonHeight: $halfButtonHeight, model: UserModel.example2)
                            .padding(.top, 52)
                        //                    .padding(.bottom, 16 + halfButtonHeight)
                    }
                    
                    VStack(alignment: .center, spacing: 0) {
                        Text(model.bio)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.top, 16 + halfButtonHeight)
                            .padding(.bottom,8)
                    }
                    .padding(.horizontal, AppConfig.safeAreaHorizontal)
                    
                    TagInterestsView(model: UserModel.example1)
                        .padding(.leading, AppConfig.safeAreaHorizontal)
                        .padding(.bottom, 32)
                    
                    ProfileConnectionsView()
                        .padding(.bottom, 32)
                    
                    VStack{
                        HStack(spacing: 0){
                            Text("Últimas experiências")
                                .font(.appHeadline)
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        LatestExperiencesListView(model: TopExperienceModel.example)
//                            .frame(height: 300000)
                    }
                    .padding(.horizontal, AppConfig.safeAreaHorizontal)
                }
            }
//            .frame(width: outerscreen.size.width, height: .infinity)
        }
        .ignoresSafeArea()
    }
}



struct ProfilePublicView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isModelView: true, model: .example2)
    }
}
