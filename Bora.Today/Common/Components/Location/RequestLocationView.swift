//
//  RequestLocationView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/10/22.
//

import SwiftUI

struct RequestLocationView: View {
    @State var isDisabled = false
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                Color.white
                HStack(alignment: .center) {
                    VStack(spacing: 16) {
                        Text("activeLocation".localized(language))
                            .font(.custom(AppFont.coveredByYourGrace.name, size: 40))
                            .foregroundColor(.appBlack)
                            .padding(0)
                        
                        Text("activeLocationDescription".localized(language))
                            .font(.appSubheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: screen.size.width * 0.7, alignment: .center)
                        
                        ButtonDefault(buttonType: ButtonType.iconAndTextBigger, text: "configure".localized(language), icon: "", action: {
                            AppHelper.openMobileSettings()
                        }, isDisabled: $isDisabled)
                    }
                }
                .frame(width: screen.size.width, height: screen.size.height, alignment: .center)
            }
        }
    }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
