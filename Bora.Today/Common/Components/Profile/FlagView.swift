//
//  FlagView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI
import FlagKit

struct FlagView: View {
    let countryCode: String
    let size: CGFloat
    
    var body: some View {
        guard let flag = Flag(countryCode: countryCode) else {
            return Image(systemName: "questionmark.circle").resizable().frame(width: size, height: size, alignment: .center)
        }
        return Image(uiImage: flag.image(style: .circle)).resizable().frame(width: size, height: size, alignment: .center)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(countryCode: "BR", size: 70)
    }
}
