//
//  GiveReviewView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 10/11/22.
//

import SwiftUI

struct GiveReviewView: View {
    
    //Tava tentando puxar a imagem do PhotoPicker pra por no componente de Review, mas não tá rolando.
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State private var photoPickerIsPresented = false
    @State var pickerResult: [UIImage] = []
    
    var body: some View {
        HStack (alignment: .center, spacing: 12){
            ForEach(pickerResult, id: \.self) { uiImage in
                ImageView(uiImage: uiImage)
            }
        }
    }
}

struct GiveReviewView_Previews: PreviewProvider {
    static var previews: some View {
        GiveReviewView()
    }
}
