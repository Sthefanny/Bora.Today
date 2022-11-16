//
//  LocalsView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 07/11/22.
//

import SwiftUI

struct LocalsView: View {
    
    let model: PlaceModel
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    
    var body: some View {
        VStack {
            HeaderView(headerTitle: "location".localized(language))
            
            ScrollView {
                VStack (alignment: .leading, spacing: 0) {
                    
                    //Esse banner tem que puxar o mapkit
                    ExperienceImageBannerView(model: ExperienceModel.example1)
                    
                    VStack (alignment: .leading, spacing: 0){
                        
                        VStack (alignment: .leading, spacing: 16) {
                            Text(model.name)
                                .font(.appTitle3)
                                .padding(.leading, 21)
                            
                            VStack (alignment: .leading, spacing: 4){
                                IconLocationTextButton(model: ExperienceModel.example1)
                                
                                HStack {
                                    Image(systemName: "link")
                                    
                                    
                                    Link(model.url, destination: URL(string: model.url)!)
                                        .font(.appFootnote)
                                        .foregroundColor(.appBlueButton)
                                }
                            }
                            .padding(.horizontal, 21)
                            
                            VStack (alignment: .leading, spacing: 0){
                                Text("experiencesHere".localized(language))
                                    .font(.appHeadline)
                                
                                LocalExperienceListView()
                                    .padding(.vertical, 16)
                            }
                            .padding(.leading, 21)
                            .padding(.top, 16)
                            
                            
                            VStack (alignment: .leading, spacing: 16){
                                Text("reviews".localized(language))
                                    .font(.appHeadline)
                                
                                VStack (alignment: .leading, spacing: 16){
                                    //Botão - muda a review
                                    CreateReviewsFilter()
                                    
                                    ReviewDynamicListView()
                                }
                            }
                            .padding(.horizontal, 21)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    struct LocalsView_Previews: PreviewProvider {
        static var previews: some View {
            LocalsView(model: PlaceModel.place1)
        }
    }
}
