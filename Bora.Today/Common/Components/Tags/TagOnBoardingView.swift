//
//  TagOnBoardingView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 12/10/22.
//

import SwiftUI

struct TagOnBoardingView: View {
    let model: TagModel
    @State var isSelected: Bool
    
    var body: some View {
        HStack {
            if model.icon != nil {
                Image(systemName: model.icon!)
                    .font(.system(size: 14))
                    .foregroundColor(isSelected ? model.color : Color.appWhite)
            }
            
            Text(model.text)
                .font(.appButtonText)
                .foregroundColor(isSelected ? model.color : Color.appWhite)
        }
        .OnboardingTagStyle(color: model.color, isSelected: isSelected)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct TagOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.appOrange.edgesIgnoringSafeArea(.all)
            VStack {
                TagOnBoardingView(model: TagModel.example1, isSelected: false)
                TagOnBoardingView(model: TagModel.example2, isSelected: false)
                TagOnBoardingView(model: TagModel.example3, isSelected: false)
            }
        }
    }
}
