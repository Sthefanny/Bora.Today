//
//  FlagView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI
import SwiftFlags

struct FlagView: View {
    let countryCode: String
    let size: CGFloat
    
    var body: some View {
        return Text(SwiftFlags.flag(for: countryCode) ?? "")
            .font(.system(size: size))
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(countryCode: "BR", size: 70)
    }
}
