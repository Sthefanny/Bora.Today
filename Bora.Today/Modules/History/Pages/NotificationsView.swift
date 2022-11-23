//
//  NotificationsView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 24/10/22.
//

import SwiftUI

struct NotificationsView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var isNotificationsPresented: Bool
    
    private var model: [NotificationModel]
    
    init(language: Language = LocalizationManager.shared.language, isNotificationsPresented: Binding<Bool>) {
        self.language = language
        self._isNotificationsPresented = isNotificationsPresented
        self.model = [NotificationModel.example1, NotificationModel.example2, NotificationModel.example3]
    }
    
    var body: some View {
        GeometryReader { screen in
            VStack(spacing: 0) {
                _buildHeader
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(0..<model.count, id: \.self) { index in
                                let item = model[index]
                                HStack(spacing: 8) {
                                    _buildNotificationImage(type: item.type)
                                    _buildNotificationText(item: item)
                                }
                                Divider()
                                    .overlay(Color.appGray)
                            }
                        }
                    }
                    .padding(.vertical, 16)
                }
            }
            .padding(.horizontal, 21)
        }
    }
    
    private var _buildHeader: some View {
        HStack(spacing: 0) {
            Spacer()
            
            Text("notificationTitle".localized(language))
                .font(.appTitle3)
                .fontWeight(.semibold)
                .foregroundColor(.appBlack)
            
            Spacer()
            
            Image(systemName: "xmark")
                .font(.system(size: 20))
                .onTapGesture {
                    isNotificationsPresented.toggle()
                }
        }
        .padding(.vertical, 16)
    }
    
    private func _buildNotificationImage(type: NotificationType) -> some View {
        HStack(spacing: 0) {
            switch type {
            case .howWasExperience:
                NotificationSystemImageView()
            case .connection, .goingToEvent:
                ProfileImageView(model: nil, size: 54)
            }
        }
    }
    
    private func _buildNotificationText(item: NotificationModel) -> some View {
        switch item.type {
        case .howWasExperience:
            return AnyView(VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 2) {
                    Text("notificationRowTitle".localized(language))
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                    
                    Text(item.event ?? "")
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                }
                
                Text("notificationRowText".localized(language))
                    .font(.appSubheadline)
                    .foregroundColor(.appBlack)
            })
        case .connection:
            return AnyView(VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 2) {
                    Text("@\(item.username ?? "")")
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                    
                    Text("notificationConnectionText".localized(language))
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                }
            })
        case .goingToEvent:
            return AnyView(VStack(alignment: .leading, spacing: 8) {
                Text("@\(item.username ?? "") ")
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                
                + Text("notificationGoingToText".localized(language))
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                
                + Text(" \(item.event ?? "")")
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
            })
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(isNotificationsPresented: .constant(true))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
