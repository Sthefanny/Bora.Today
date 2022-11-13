//
//  LocalsView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 07/11/22.
//

import SwiftUI

struct LocalsView: View {
    
    let model: ExperienceModel
    
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
                        
                        HStack (alignment: .center){
                        VStack (alignment: .leading, spacing: 16){
                            Text("experiencesHere".localized(language))
                                .font(.appHeadline)
                            
                            //NÃO TÁ DO TAMANHO CERTO - 119
                            CreateExperienceCornerButton(buttonType: ButtonType.iconAndTextBigger, text: "Create Experience", icon: "createIcon2", action: {print("teste")}, isDisabled: .constant(false))
                        }
                        .padding(.leading, 21)
                            
                            //A lista tá aparecendo cortada e menor que o botão de criar experiência
                            LocalExperienceListView()
                        }
                        
                        
    
                        
                        VStack (alignment: .leading, spacing: 16){
                            Text("reviews".localized(language))
                                .font(.appHeadline)
                            
                            VStack (alignment: .leading, spacing: 16){
                                //Botão - muda a review
                            CreateReviewsFilter()
                            
                            ReviewDynamicListView()
                            }
                        }
                        .padding(.leading, 21)
                        
            
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
