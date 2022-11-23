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
    
    var shouldShowBack: Bool = false
    
    @State var isPresented = false
    
    @State private var isConnected: Bool = false
    
    var body: some View {
        GeometryReader { outerscreen in
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        ZStack{
                            if isSelfProfile == true {
                                backgroundPrivateColor
                                    .edgesIgnoringSafeArea(.top)
                            } else {
                                backgroundPublicColor
                                    .edgesIgnoringSafeArea(.top)
                            }
                            VStack {
                                if shouldShowBack {
                                    HeaderView()
                                        .padding(.top, 46)
                                }
                                ProfileHeaderView(isModelView: $isSelfProfile, halfButtonHeight: $halfButtonHeight, isPresented: $isPresented, isConnected: $isConnected, model: model)
                                    .padding(.top, 52)
                            }
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
                        
                        TagInterestsView(model: model)
                            .padding(.bottom, 32)
                            .padding(.top, 8)
                        
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
                        }
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                    }
                }
                
                UnfriendView(isPresented: $isPresented, isConnected: $isConnected)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}



struct ProfilePublicView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isSelfProfile: true, model: .example2, shouldShowBack: true)
    }
}
