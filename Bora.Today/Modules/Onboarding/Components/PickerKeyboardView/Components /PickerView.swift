//
//  PickerView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 01/11/22.
//

import SwiftUI

//config acoes dos botoes
//passar info do pa;is selecionado

struct PickerView: View {
    
    var description: String?
    @State var selectedIndex: Int? = nil
    var options: [String] = CountryHelper.getCountries()
    
    var body: some View {
        VStack{
            VStack {
                Picker("Seu país de origem", selection: $selectedIndex) {
                    ForEach(options, id: \.self) {
                        Text($0)
                            .foregroundColor(.appBlack)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0)
                .background(Color.appWhite)
                
//                Text("selecionou \(options)")
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.appBlue
            PickerView()

        }
    }
}
