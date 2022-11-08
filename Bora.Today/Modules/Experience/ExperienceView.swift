//
//  ExperienceView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 18/10/22.
//

import SwiftUI

struct ExperienceView: View {
    let model: ExperienceModel
    
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center) {
                
                Spacer()
                
                ExperienceImageBannerView(model: ExperienceModel.example1)
                
                VStack (alignment: .leading, spacing: 32){
                    
                    VStack (alignment: .leading, spacing: 16) {
                        Text(model.name)
                            .font(.appTitle3)
                        
                        HStack (alignment: .center, spacing: 12){
                            VStack (alignment: .leading, spacing: 4){
                                IconLocationTextButton(model: ExperienceModel.example1)
                                
                                HStack {
                                    Image(systemName: "clock.fill")
                                    Text(model.datetime)
                                }
                                .font(.appFootnote)
                                
                            }
                            Spacer()
                            
                            CreateHostedButton(model: ReviewModel.example1)
                        }
                    }
                    .padding(.horizontal, AppConfig.safeAreaHorizontal)
                    
                    
                    //Chamar texto do Model - Lari já fez
                    CreateTextExpandView("Muitas barraquinhas e comidas típicas da Tailandia pra voce se deliciar e conhecer um pouco mais sobre a culinária tailandesa no Brasil e aproveitar. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. but also the leap into electronic typesetting, remaining essentially unchanged. Muitas barraquinhas e comidas típicas da Tailandia pra voce se deliciar e conhecer um pouco mais sobre a culinária tailandesa no Brasil e aproveitar. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. but also the leap into electronic typesetting, remaining essentially unchanged.", lineLimit: 3)
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                    
                    VStack (alignment: .leading, spacing: 16){
                        Text("participants".localized(language))
                            .font(.appHeadline)
                            .padding(.leading, 21)
                        
                        CreateUsersListView()
                    }
                    
                }
                
                Spacer()
                    .frame(height: 64)
                
                HStack (alignment: .center, spacing: 12){
                    SaveButton()
                    
                    ButtonDefaultBig(buttonType: .imageAndTextBigger, text: "Bora!", icon: "seal.fill", action: {print("teste")}, isDisabled: .constant(false))
                }
                .padding(.horizontal, AppConfig.safeAreaHorizontal)
                
                
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(model: ExperienceModel.example1)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
