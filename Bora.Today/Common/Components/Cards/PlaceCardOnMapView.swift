//
//  PlaceCardOnMapView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 13/11/22.
//

import SwiftUI

struct PlaceCardOnMapView: View {
    let model: PlaceModel
    
    var body: some View {
        
        NavigationLink(destination: LocalsView(model: model)) {
            HStack(spacing: 16) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(model.name)
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                    
                    HStack(alignment: .top, spacing: 0) {
                        HStack(alignment: .top) {
                            Image("pin_place")
                                .foregroundColor(.black)
                            
                            Text(model.address)
                                .lineLimit(2)
                                .font(.appFootnote)
                                .foregroundColor(.appDarkGray)
                                .padding(.trailing, 20)
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.67, alignment: .leading)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.appBlueButton)
                            
                            Text(String(format: "%.1f", 3)) //ToDo: Chamar da API
                                .font(.appSubheadline)
                            
                        }
                    }
                }
            }
            .padding(16)
            .background(Color.appWhite)
            .cornerRadius(18)
            .shadow(color: .appGray, radius: 4, x: 0, y: 0)
            .frame(minWidth: 0, maxWidth: 348, minHeight: 119, maxHeight: 119)
        }
    }
}

struct PlaceCardOnMapView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            PlaceCardOnMapView(model: PlaceModel.place1)
        }
    }
}
