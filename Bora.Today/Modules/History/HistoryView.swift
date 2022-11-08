//
//  HistoryView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 17/10/22.
//

import SwiftUI

struct HistoryView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    private let model: UserModel
    
    @State var isDisabled = false
    @State var isNotificationsPresented = false
    @State var isLocationHistoryPresented = false
    
    init() {
        model = UserModel.example1
    }
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        _buildHeader
                        
                        _buildWelcome
                        
                        _buildCards
                        
                        _buildAchievements
                    }
                    .frame(width: screen.size.width, height: screen.size.height, alignment: .topLeading)
                    .padding(.vertical, 20)
                }
                .frame(height: screen.size.height)
                .popover(isPresented: $isNotificationsPresented) {
                    NotificationsView(isNotificationsPresented: $isNotificationsPresented)
                }
                
                LocationHistoryView(isLocationHistoryPresented: $isLocationHistoryPresented)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private var _buildHeader: some View {
        HStack(alignment: .top, spacing: 0) {
            Text("historyTitle".localized(language))
                .font(.appTitle1)
                .foregroundColor(.appBlack)
            
            Spacer()
            
            ButtonText(buttonType: .imageAndText, text: "notificationsButton".localized(language), icon: "bell.badge", action: {
                self.isNotificationsPresented = true
            }, color: .appBlueButton, isDisabled: $isDisabled)
        }
        .padding(.horizontal, 21)
        .padding(.vertical, 0)
    }
    
    private var _buildWelcome: some View {
        VStack(alignment: .leading, spacing: 4) {
            //ToDo: ver como traduzir com parametro em tempo real
            HStack(spacing: 2) {
                Text("historyGreeting1")
                    .font(.appCallout)
                    .foregroundColor(.black)
                Text("\(model.name)!")
                    .font(.appCallout)
                    .foregroundColor(.black)
                Text("historyGreeting2")
                    .font(.appCallout)
                    .foregroundColor(.black)
            }
            
            HStack(spacing: 4) {
                Text(model.actualCity)
                    .font(.appHeadline)
                    .foregroundColor(.appBlueButton)
                    .underline()
                
                Image(systemName: "square.and.pencil")
                    .font(.appHeadline)
                    .foregroundColor(.appBlueButton)
            }
            .onTapGesture {
                self.isLocationHistoryPresented = true
            }
        }
        .padding(.horizontal, 21)
        .padding(.vertical, 32)
    }
    
    private var _buildCards: some View {
        HStack (spacing: 12) {
            NavigationLink(destination: CalendarView()) {
                HistoryCardView(model: model.history[0])
            }
            
            VStack (spacing: 12) {
                
                HistoryCardView(model: model.history[1])
                
                HistoryCardView(model: model.history[2])
            }
        }
        .padding(.horizontal, 21)
    }
    
    private var _buildAchievements: some View {
        HistoryAchievementView()
            .padding(.top, 32)
            .padding(.bottom, 16)
    }
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
