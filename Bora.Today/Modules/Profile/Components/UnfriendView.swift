//
//  UnfriendView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 23/11/22.
//

import SwiftUI

struct UnfriendView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var isPresented: Bool
    @Binding var isConnected: Bool
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                if isPresented {
                    Color.black.opacity(isPresented ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                    
                    Image(systemName: "close")
                    
                    VStack(spacing: 0) {
                        _buildHeader
                        
                        _buildDescription
                        
                        Spacer()
                        
                        _buildButton
                    }
                    .padding(.vertical, 21)
                    .frame(width: screen.size.width * 0.7 , height: screen.size.height * 0.4, alignment: .top)
                    .background(Color.appWhite)
                    .cornerRadius(18)
                    .padding(.vertical, 0)
                }
            }
        }
    }
    
    private var _buildHeader: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                
                Image(systemName: "xmark")
                    .font(.system(size: 20))
                    .onTapGesture {
                        isPresented.toggle()
                    }
                    .padding(.horizontal, 15)
            }
            
            Text("unfriendTitle".localized(language))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(.custom(AppFont.figtree.name, size: 32))
                .fontWeight(.bold)
                .foregroundColor(.appBlack)
                .padding(.horizontal, 32)
        }
        .padding(.bottom, 20)
    }
    
    private var _buildDescription: some View {
        Text("unfriendDescription".localized(language))
            .font(.appButtonText)
            .multilineTextAlignment(.center)
            .fontWeight(.semibold)
            .foregroundColor(.appBlack)
            .padding(.horizontal, 32)
    }
    
    var _buildButton: some View {
        ButtonDefault(buttonType: ButtonType.textOnlyBigger, text: "unfriendButton".localized(language), icon: "", action: {
            isConnected.toggle()
            isPresented.toggle()
        }, isDisabled: .constant(false))
    }
}

struct UnfriendView_Previews: PreviewProvider {
    static var previews: some View {
        UnfriendView(isPresented: .constant(true), isConnected: .constant(false))
    }
}
