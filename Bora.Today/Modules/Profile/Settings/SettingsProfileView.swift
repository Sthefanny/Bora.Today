//
//  SettingsProfileView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 09/11/22.
//

import SwiftUI

struct SettingsProfileView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    private var backgroundPrivateColor: Color
    private var model : UserModel
    
    @State var goesToLanguageSelection = false
    
    init() {
        self.backgroundPrivateColor = Color.appYellow
        self.model = UserModel.example1
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack{
                    HeaderView(headerTitle: "settings".localized(language))
                        .padding(.bottom,32)
                    
                    VStack {
                        Button(action: {}, label: {
                            GroupBox(content: {
                                SettingsProfileMyProfileRowView(model: model)
                            }, label: {
                            })
                            .groupBoxStyle(SettingsProfileGroupBoxStyle(backgroundPrivateColor: backgroundPrivateColor))
                            .padding(.bottom,32)
                        }) //direcionar para ProfileEditView
                        
                        SettingsProfileLabelView(labelText: "settings".localized(language))
                        GroupBox(content: {
                            HStack {
                                Text("language".localized(language))
                                    .font(.appButtonText)
                                    .foregroundColor(.appBlack)
                                Spacer()
                                Button(action: {
                                    self.goesToLanguageSelection = true
                                }, label: {
                                    Text(LocalizationManager.shared.language == .english ? "english".localized(language) : "portuguese".localized(language))
                                        .font(.appSubheadline)
                                        .foregroundColor(.appBlueButton)
                                })
                            }
                        }, label: {
                        })
                        .groupBoxStyle(SettingsGroupBoxStyle())
                        .padding(.bottom, 32)
                        
                        SettingsProfileLabelView(labelText: "about".localized(language))
                        GroupBox(content: {
                            VStack (spacing: 16){
                                SettingsProfileRowView(settingsRowType: .onlyImage, title: "BoraCast", linkDestination: "bora.today/")
                                Divider()
                                    .frame(height:1)
                                    .overlay(Color.appWhite)
                                    .padding(.vertical,0)
                                SettingsProfileRowView(settingsRowType: .onlyImage, title: "Instagram", linkDestination: "www.instagram.com/boragroup_on/")
                                Divider()
                                    .frame(height:1)
                                    .overlay(Color.appWhite)
                                    .padding(.vertical,0)
                                SettingsProfileRowView(settingsRowType: .onlyImage, title: "aboutBora".localized(language), linkDestination: "bora.today/")
                                Divider()
                                    .frame(height:1)
                                    .overlay(Color.appWhite)
                                    .padding(.vertical,0)
                                SettingsProfileRowView(settingsRowType: .onlyImage, title: "evaluateBora".localized(language), linkDestination: "") //link da loja
                                Divider()
                                    .frame(height:1)
                                    .overlay(Color.appWhite)
                                    .padding(.vertical,0)
                                SettingsProfileRowView(settingsRowType: .onlyImage, title: "contactUs".localized(language), linkDestination: "") //link email contato@bora.today //
                            }
                        }, label: {
                        })
                        .groupBoxStyle(SettingsGroupBoxStyle())
                        .padding(.bottom,32)
                        
                        //                 MARK: - SECTION 1
                        GroupBox(content: {
                            SettingsProfileRowView(settingsRowType: .onlyTitle, title: "logout".localized(language), titleColor: .appRed, linkDestination: "")
                        }, label: {
                        })
                        .groupBoxStyle(SettingsGroupBoxStyle())
                        .padding(.bottom,32)
                        
                        // MARK: - SECTION 2
    //                    GroupBox(content: {
    //                        SettingsProfileRowView(settingsRowType: .onlyTitle, title: "Adicionar conta", titleColor: .appGreen, linkDestination: "")
    //                    }, label: {
    //                    })
    //                    .groupBoxStyle(SettingsGroupBoxStyle())
    //                    .padding(.bottom,32)
                    }
                    .padding(.horizontal, AppConfig.safeAreaHorizontal)
                    //            Spacer()
                    
                }
                
                
                SettingsProfileChangeLanguageView(isPresented: $goesToLanguageSelection)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - PREVIEW

struct SettingsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileView()
    }
}

private struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var headerTitle: String?
    
    var body: some View {
        ZStack (alignment: .center){
            //            NavigationLink(destination: Text("ssi"), label: {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack(spacing:4){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                    Text("back".localized(language))
                        .font(.appButtonText)
                    Spacer()
                }.foregroundColor(Color.appBlueButton)
            })
            
            Text(headerTitle != nil ? headerTitle!.localized(language) : "")
                .font(.appTitle2)
        }
        .padding(.horizontal, AppConfig.safeAreaHorizontal)
        .padding(.top, 16)
    }
}

struct SettingsGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.appLightGray))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

struct SettingsProfileGroupBoxStyle: GroupBoxStyle {
    var backgroundPrivateColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 26).fill(backgroundPrivateColor))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}
