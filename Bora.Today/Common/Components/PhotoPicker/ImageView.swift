//
//  ImageView.swift
//  PHPhotoPickerSwiftUI
//

import SwiftUI

struct ImageView: View {
    var uiImage: UIImage
    @State private var selected: Bool = false
    
    var body: some View {
        VStack {
        Image(uiImage: uiImage)
            .resizable()
            .scaledToFill()
            .frame(width: 64, height: 64)
            .background(Color.black.opacity(0.2))
            .cornerRadius(18)
        }
        .onTapGesture {
            selected.toggle()
        }
        //Stel, ele tem um tap que fica levemente maior (não descobri como ficar fullscreen ou modal com botão de fechar, acho que deve ter pronto no PhotoPicker)
        .scaleEffect(self.selected ? 1.5 : 1)
    }
}
