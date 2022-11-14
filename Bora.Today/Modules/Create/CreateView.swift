//
//  CreateView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 19/09/22.
//


import SwiftUI

class CreateExperience: ObservableObject {
    @Published var title: String = ""
    @Published var place: String = ""
    @Published var description: String = ""
}

struct CreateView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var shouldShowBack: Bool = false
    
    var createExperience = CreateExperience()
    
    func validateTextField(value: String) -> Bool {
        return !value.isEmpty
    }
    //var photoSelected: Bool = false
    
    var body: some View {
        GeometryReader { screen in
            VStack {
                if shouldShowBack {
                    HeaderView(headerTitle: "createViewTitle")
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        if !shouldShowBack {
                            Text("createViewTitle".localized(language))
                                .font(.appTitle1)
                                .foregroundColor(.appBlack)
                                .padding(.top, 16)
                                .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        }
                        
                        //adicioanr photo picker aqui
//                        Text("PHOTO PICKER")
//                            .padding(.horizontal, AppConfig.safeAreaHorizontal)
//                            .padding(.top, 16)
                    
                        
                        CreateSelectStickerView()
                        
                        TextFieldWithTitleView(
                            title: "textFieldTitle".localized(language),
                            value: createExperience.title,
                            errorMessage: "errorMessageTitle".localized(language),
                            validate: self.validateTextField
                        )
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                        TextFieldWithTitleView(
                            title: "textFieldPlace".localized(language),
                            value: createExperience.place,
                            errorMessage: "errorMessagePlace".localized(language),
                            validate: self.validateTextField
                        )
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                        
                        CreateDatePickerView(date: .now)
                            .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                        TextAreaLimitedView(
                            title: "textAreaTitle".localized(language),
                            example: "textAreaPlaceholder".localized(language),
                            value: createExperience.place,
                            errorMessage: "errorMessageTextArea".localized(language),
                            validate: self.validateTextField)
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                        CreateSelectTagView()
                        
                        CreateSliderView()
                            .padding(.horizontal, AppConfig.safeAreaHorizontal)
                        
                        ButtonDefault(buttonType: .textOnly, text: "postButton".localized(language), icon: "", action: {
                            print("publicar")
                        }, isDisabled: .constant(false))
                        .frame(width: screen.size.width, alignment: .center)
                        
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    struct CreateView_Previews: PreviewProvider {
        static var previews: some View {
            CreateView()
        }
    }
}
