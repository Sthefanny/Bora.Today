//
//  CreateReviewsFilter.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 07/11/22.
//

import SwiftUI

//DE RUIM, DEPOIS EU ARRUMO

struct CreateReviewsFilter: View {
    
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    //    @State var color: Color
    @State var currentSelected: Int = 0
    //    @State var title: String
    
    var filters = ["Todos", "Amigos", "Mesmo pais"]
    
    var body: some View {
        HStack {
            ForEach(filters.enumerated().map { $0 }, id: \.offset){ (index, filterOption) in
                CapsuleView(content: Text(filterOption), isSelected: index == currentSelected)
                    .onTapGesture {
                        currentSelected = index
                    }
            }
        }
    }
}

struct CapsuleView<V>: View where V: View {
    let content: V
    let isSelected: Bool
    
    var body: some View {
//        content
        if isSelected {
            content
                .foregroundColor(Color.appWhite)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.appBlueButton)
                )
        } else {
            content
                .foregroundColor(Color.appGrayText)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.appBlueButtonStrokeDisabled)
                )
        }
    }
}

struct CreateReviewsFilter_Previews: PreviewProvider {
    static var previews: some View {
        CreateReviewsFilter()
    }
}
