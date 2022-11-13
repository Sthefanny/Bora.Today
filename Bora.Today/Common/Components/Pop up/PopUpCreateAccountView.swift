//
//  PopUpCreateAccountView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 10/11/22.
//

import SwiftUI

struct PopUpCreateAccountView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var isPresented: Bool
    
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                
                if isPresented {
                    Color.black.opacity(isPresented ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        _buildHeader
                
                        
                        Text("createAccount".localized(language))
                            .font(.appHeadline)
                            .padding(.bottom, 4)
                            
                        
                        Image("HorizontalLogo")
                            .padding(.bottom, 32)
                        
                        
                        Text("discover".localized(language))
                            .font(.appCallout)
                            .foregroundColor(.appGrayText)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 32)
                        
                        ButtonDefault(buttonType: ButtonType.iconAndTextBigger, text: "continueApple".localized(language), icon: "apple.logo", action: {}, isDisabled: .constant(false))
                            .padding(.bottom, 16)
                        
                        VStack(spacing: 2) {
                            
                            HStack(spacing: 2) {
                                Text("legalText1".localized(language))
                                    .font(.appCaption2)
                                    .foregroundColor(.appDarkGray)
                                
                                Link("terms".localized(language), destination: URL(string: "https://bora.today/politica-de-privacidade/")!)
                                    .font(.appCaption2)
                                    .foregroundColor(.appBlueButton)

                            }
                            
                            Text("legalText2".localized(language))
                                .font(.appCaption2)
                                .foregroundColor(.appDarkGray)
                            
                            Link("privacyPolicy".localized(language), destination: URL(string: "https://bora.today/termos-de-servico/")!)
                                .font(.appCaption2)
                                .foregroundColor(.appBlueButton)
                           
                        }
                        .padding(.bottom, 16)
                        
                        
                        HStack (spacing: 4) {
                            Text("already".localized(language))
                                .font(.appCallout)
                            
                            Text("logIn".localized(language))
                                .font(.appButtonText)
                                .foregroundColor(.appBlueButton)
                        }
                        
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 21)
                    .frame(width: screen.size.width * 0.8 , height: screen.size.height * 0.5)
                    .background(Color.appWhite)
                    .cornerRadius(18)
                    .padding(.vertical, 0)
                }
            }
        }
    }
    
    private var _buildHeader: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                
                Image(systemName: "xmark")
                    .font(.system(size: 20))
                    .onTapGesture {
                        isPresented.toggle()
                    }
            }
            
            Text("")
                .font(.appTitle3)
                .fontWeight(.semibold)
                .foregroundColor(.appBlack)
        }
        .padding(.bottom, 8)
    }
}


struct PopUpCreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpCreateAccountView(isPresented: .constant(true))
    }
}
