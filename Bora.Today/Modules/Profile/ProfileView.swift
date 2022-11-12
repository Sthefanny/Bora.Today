//
//  ProfilePublicView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 07/11/22.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    // true se for privado
    // false se for público
    @State var isSelfProfile : Bool
    @State var halfButtonHeight: CGFloat = 35/2
    
    var backgroundPrivateColor: Color = .appYellow
    var backgroundPublicColor: Color = .appPink
    
    let model : UserModel
    
    var body: some View {
        GeometryReader { outerscreen in
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    ZStack{
                        if isSelfProfile == true {
                            backgroundPrivateColor
                                .edgesIgnoringSafeArea(.top)
//                                .frame(height: outerscreen.size.height * 0.35)
                        } else {
                            backgroundPublicColor
                                .edgesIgnoringSafeArea(.top)
//                                .frame(height: outerscreen.size.height * 0.32) // valor antigo (sem geometry readers)
                        }
                        ProfileHeaderView(isModelView: $isSelfProfile, halfButtonHeight: $halfButtonHeight, model: UserModel.example2)
                            .padding(.top, 52)
                        //                    .padding(.bottom, 16 + halfButtonHeight)
                    }
                    .edgesIgnoringSafeArea(.top)
                    
                    VStack(alignment: .center, spacing: 0) {
                        Text(model.bio)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.top, 16 + halfButtonHeight)
                            .padding(.bottom, 8)
                    }
                    .padding(.horizontal, AppConfig.safeAreaHorizontal)
                    
                    TagInterestsView(model: UserModel.example1)
//                        .padding(.leading, AppConfig.safeAreaHorizontal)
                        .padding(.bottom, 32)
                    
                    ProfileConnectionsView()
                        .padding(.bottom, 32)
                    
                    VStack{
                        HStack(spacing: 0){
                            Text("lastExperiences".localized(language))
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}



struct ProfilePublicView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isSelfProfile: true, model: .example2)
    }
}
