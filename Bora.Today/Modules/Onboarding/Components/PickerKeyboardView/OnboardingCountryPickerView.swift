//
//  OnboardingCountryPicker.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 27/10/22.
//

import SwiftUI

struct OnboardingCountryPickerView: View {
    
    @State var selectedIndex: Int? = nil
    let options: [String] = CountryHelper.getCountries()
    let isSelected: Bool = false
    
    var body: some View {
        GeometryReader { screen in
            ZStack{
                Capsule()
                    .foregroundColor(Color.appWhite)
                    .frame(width: screen.size.width*0.7 + AppConfig.safeAreaHorizontal, height: 50)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0)
                    .overlay(content: {
                        HStack{
                           Text("Seu país de origem")
//                            PickerField("Seu país de origem", data: self.options, selectionIndex: self.$selectedIndex)
                                .font(.appSubheadline)
                                .foregroundColor(.appGrayText)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.appBlueButton)
                                .frame(width: 12, height: 12)
                        }
                        .padding(.horizontal,16)
                    })
                
            }
            .padding(.horizontal, 16)
            
        }
    }
}

struct OnboardingCountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCountryPickerView()
            .previewInterfaceOrientation(.portrait)
    }
}
