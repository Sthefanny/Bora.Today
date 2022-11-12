//
//  SwitchButtonView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/11/22.
//

import SwiftUI

struct SwitchButtonView: View {
    @State private var sideSelected: SwitchSides = .left
    
    var leftText: String
    var rightText: String
    
    var leftAction: () -> Void
    var rightAction: () -> Void
    
    
    var body: some View {
        VStack {
            if sideSelected == .right {
                HStack(alignment: .center, spacing: 0) {
                    Text(leftText)
                        .switchButtonUnselected
                        .onTapGesture {
                            sideSelected = .left
                            leftAction()
                        }
                    
                    Text(rightText)
                        .switchButtonSelected
                        .onTapGesture {
                            sideSelected = .right
                            rightAction()
                        }
                }
                .frame(width: 229, height: 40, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius: 26)
                    .stroke(Color.appGray))
            } else {
                HStack(alignment: .center, spacing: 0) {
                    Text(leftText)
                        .switchButtonSelected
                        .onTapGesture {
                            sideSelected = .left
                            leftAction()
                        }
                    
                    Text(rightText)
                        .switchButtonUnselected
                        .onTapGesture {
                            sideSelected = .right
                            rightAction()
                        }
                }
                .frame(width: 229, height: 40, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius: 26)
                    .stroke(Color.appGray))
            }
            
            
        }
    }
}

struct SwitchButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButtonView(leftText: "Experiências", rightText: "Locais", leftAction: {}, rightAction: {})
    }
}



extension View {
    var switchButtonUnselected: some View {
        self
            .font(.custom(AppFont.figtree.name, size: 14))
            .foregroundColor(Color.appGray)
            .frame(width: 107, height: 40, alignment: .center)
    }
}

extension View {
    var switchButtonSelected: some View {
        self
            .font(.custom(AppFont.figtree.name, size: 14))
            .foregroundColor(Color.appWhite)
            .frame(width: 122, height: 40, alignment: .center)
            .background(Color.appBlueButton)
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
