//
//  CreateSliderView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 25/10/22.
//

import SwiftUI

struct CreateSliderView: View {
    @State var sliderValue: Double = 3
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        VStack {
            HStack {
                Text("\(Text("sliderTitle".localized(language))) \(Image("asterisk"))")
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                
                
                Spacer()
                
                Text(
                    String(format: "%.0f", sliderValue)
                )
                .font(.appTitle1)
                .foregroundColor(Color.appBlue)
                
                if sliderValue == 100 {
                    Text("+")
                        .font(.appTitle1)
                        .foregroundColor(Color.appBlue)
                        .padding(.leading, -6)
                        
                }
            }
            .padding(.bottom, -2)
            
            
            Slider(
                value: $sliderValue,
                in: 3...100,
                step: 1.0,
//                onEditingChanged: { (_) in
//                    color = .green
                //QUERO COLOCAR HAPTICS AQUI
//                },
                minimumValueLabel: Text("3"),
                maximumValueLabel: Text("100+"),
                label: {
                    Text("Quantidade")
                })
        }
    }
        
}

struct CreateSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSliderView()
    }
}
