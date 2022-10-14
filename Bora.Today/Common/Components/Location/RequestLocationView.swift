//
//  RequestLocationView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/10/22.
//

import SwiftUI

struct RequestLocationView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State var isDisabled = false
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        GeometryReader { screen in
            HStack(alignment: .center) {
                VStack(spacing: 16) {
                    Text("activeLocation".localized(language))
                        .font(.custom(AppFont.coveredByYourGrace.name, size: 40))
                        .padding(0)
                    
                    Text("activeLocationDescription".localized(language))
                        .font(.appSubheadline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .frame(width: screen.size.width * 0.7, alignment: .center)
                    
                    ButtonDefault(buttonType: ButtonType.imageAndTextBigger, text: "configure".localized(language), icon: "", action: {
                        AppHelper.openMobileSettings()
                    }, isDisabled: $isDisabled)
                }
            }
            .frame(width: screen.size.width, height: screen.size.height, alignment: .center)
        }
    }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
