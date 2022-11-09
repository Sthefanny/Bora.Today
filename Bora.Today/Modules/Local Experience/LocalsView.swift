//
//  LocalsView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 07/11/22.
//

import SwiftUI

struct LocalsView: View {
    
    let model: ExperienceModel
    
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                
                Spacer()
                
                //Esse banner tem que puxar o mapkit
                ExperienceImageBannerView(model: ExperienceModel.example1)
                
                VStack (alignment: .leading, spacing: 32){
                    
                    VStack (alignment: .leading, spacing: 16) {
                        Text(model.name)
                            .font(.appTitle3)
                            .padding(.leading, 21)
                        
                        HStack (alignment: .center, spacing: 12){
                            VStack (alignment: .leading, spacing: 4){
                                IconLocationTextButton(model: ExperienceModel.example1)
                                
                                HStack {
                                    Image(systemName: "clock.fill")
                                    Text(model.datetime)
                                }
                                .font(.appFootnote)
                            }
                        }
                        .padding(.init(top: 0, leading: 21, bottom: 0, trailing: 21))
                        
                        VStack (alignment: .leading, spacing: 16){
                            Text("experiencesHere".localized(language))
                                .font(.appHeadline)
                            
                            CreateExperienceCornerButton(buttonType: ButtonType.imageAndTextBigger, text: "Create Experience", icon: "createIcon2", action: {print("teste")}, isDisabled: .constant(false))
                        }
                        .padding(.leading, 21)
                        
    
                        
                        VStack (alignment: .leading, spacing: 16){
                            Text("reviews".localized(language))
                                .font(.appHeadline)
                                .padding(.leading, 21)
                        }
                        
                    }
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
    
    struct LocalsView_Previews: PreviewProvider {
        static var previews: some View {
            LocalsView(model: ExperienceModel.example1)
        }
    }
}
