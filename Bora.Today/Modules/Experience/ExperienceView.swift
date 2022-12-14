//
//  ExperienceView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 18/10/22.
//

import SwiftUI

struct ExperienceView: View {
    let model: ExperienceModel
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        VStack {
            HeaderView(headerTitle: "experience".localized(language))
            
            ScrollView(showsIndicators: false) {
                VStack (alignment: .center, spacing: 0) {
                    
                    ExperienceImageBannerView(model: model)
                    
                    VStack (alignment: .leading, spacing: 32){
                        
                        VStack (alignment: .leading, spacing: 16) {
                            Text(model.name)
                                .font(.appTitle3)
                            
                            HStack (alignment: .center, spacing: 12){
                                VStack (alignment: .leading, spacing: 4){
                                    
                                    IconLocationTextButton(model: model)
                                    
                                    HStack {
                                        Image(systemName: "clock.fill")
                                        Text(DateHelper.getFormattedDate(model.event.initialDate, format: "MMM dd, HH:mm"))
                                    }
                                    .font(.appFootnote)
                                    
                                }
                                
                                Spacer()
                                
                                CreateHostedButton(model: model.createdBy)
                            }
                        }
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                        
                        CreateTextExpandView(model, lineLimit: 3)
                            .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                        VStack (alignment: .leading, spacing: 16){
                            Text("participants".localized(language))
                                .font(.appHeadline)
                                .padding(.leading, 21)
                            
                            CreateUsersListView()
                        }
                    }
                    
                    if model.isSaved {
                        if model.reviews != nil {
                            VStack (alignment: .leading, spacing: 16){
                                Text("evaluations".localized(language))
                                    .font(.appHeadline)
                                    .foregroundColor(.appBlack)
                                    .padding(.bottom, 16)
                                
                                VStack (alignment: .leading, spacing: 16){
                                    //Bot??o - muda a review
                                    CreateReviewsFilter()
                                    
                                    ReviewDynamicListView(model: model.reviews!)
                                }
                            }
                            .padding(.horizontal, AppConfig.safeAreaHorizontal)
                            .padding(.top, 32)
                            .padding(.bottom, 16)
                        }
                    }
                    else {
                        HStack (alignment: .center, spacing: 12){
                            SaveButton()
                            
                            ButtonDefaultBig(buttonType: .iconAndTextBigger, text: "Bora!", icon: "seal.fill", action: {print("teste")}, isDisabled: .constant(false))
                        }
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        .padding(.top, 64)
                        .padding(.bottom, 16)
                    }
                    
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(model: ExperienceModel.example2)
        //            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
