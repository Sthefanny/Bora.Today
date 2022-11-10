//
//  ImageView.swift
//  PHPhotoPickerSwiftUI
//

import SwiftUI

struct ImageView: View {
  var uiImage: UIImage
  
  var body: some View {
    Image(uiImage: uiImage)
      .resizable()
      .scaledToFill()
      .frame(width: 64, height: 64)
      .background(Color.black.opacity(0.2))
      .cornerRadius(18)
  }
}
