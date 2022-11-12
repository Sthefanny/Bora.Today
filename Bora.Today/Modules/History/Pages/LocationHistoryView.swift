//
//  LocationHistoryView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/10/22.
//

import SwiftUI

struct LocationHistoryView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var isLocationHistoryPresented: Bool
    
    private var model: [LocationHistoryModel]
    
    init(language: Language = LocalizationManager.shared.language, isLocationHistoryPresented: Binding<Bool>) {
        self.language = language
        self._isLocationHistoryPresented = isLocationHistoryPresented
        self.model = [LocationHistoryModel.example1, LocationHistoryModel.example2, LocationHistoryModel.example3, LocationHistoryModel.example4, LocationHistoryModel.example5]
    }
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                if isLocationHistoryPresented {
                    Color.black.opacity(isLocationHistoryPresented ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        _buildHeader
                        
                        ScrollView {
                            VStack(spacing: 0) {
                                LazyVStack(alignment: .leading, spacing: 16) {
                                    ForEach(0..<model.count, id: \.self) { index in
                                        let item = model[index]
                                        HStack(spacing: 8) {
                                            _buildPlaceDetails(location: item.location)
                                        }
                                        Divider()
                                            .overlay(Color.appGray)
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 32)
                        
                        _buildButton
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
                    isLocationHistoryPresented.toggle()
                }
            }
            
            Text("locationHistoryTitle".localized(language))
                .font(.appTitle3)
                .fontWeight(.semibold)
                .foregroundColor(.appBlack)
        }
        .padding(.bottom, 8)
    }
    
    func _buildPlaceDetails(location: String) -> some View {
        HStack(spacing: 4) {
            Image("pin_place")
                .foregroundColor(.appGray)
            
            Text(location)
                .font(.appFootnote)
                .foregroundColor(.appBlueButton)
            
        }
    }
    
    var _buildButton: some View {
        ButtonDefault(buttonType: ButtonType.imageAndTextBigger, text: "locationHistoryButton".localized(language), icon: "plus", action: {}, isDisabled: .constant(false))
    }
}

struct LocationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        LocationHistoryView(isLocationHistoryPresented: .constant(true))
    }
}
