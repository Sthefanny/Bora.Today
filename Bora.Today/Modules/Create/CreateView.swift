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
    
    @State private var selectedImages: [UIImage] = []
    
    var shouldShowBack: Bool = false
    
    var createExperience = CreateExperience()
    
    func validateTextField(value: String) -> Bool {
        return !value.isEmpty
    }
    
    var body: some View {
        GeometryReader { screen in
            VStack(alignment: .leading) {
                if shouldShowBack {
                    HeaderView(headerTitle: "createViewTitle")
                } else {
                    Text("createViewTitle".localized(language))
                        .font(.appTitle1)
                        .foregroundColor(.appBlack)
                        .padding(.top, 16)
                        .padding(.horizontal, AppConfig.safeAreaHorizontal)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        PhotoPickerView(selectedImages: $selectedImages, maxSelectionCount: 1, isCover: true)
                            .frame(width: screen.size.width, alignment: .center)
                        
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
                        
                        ButtonDefault(buttonType: .textOnlyBigger, text: "postButton".localized(language), icon: "", action: {
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
