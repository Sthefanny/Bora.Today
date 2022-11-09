//
//  CreateReviewImage.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 27/10/22.
//

import SwiftUI

struct CreateReviewImage: View {
    //    @State private var selectedImage: UIImage?
    //    @State private var isImagePickerDisplay = false
    //    @State private var selected: Bool = false
    @State private var image = UIImage()
    @State private var showSheet = false
    //    @State var images: [UIImage]
    
    var body: some View {
        HStack (alignment: .center, spacing: 12){
            
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .background(Color.black.opacity(0.2))
                .cornerRadius(18)
                .onTapGesture {
                    showSheet = true
                }
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
        }
    }
}

struct CreateReviewImage_Previews: PreviewProvider {
    static var previews: some View {
        CreateReviewImage()
    }
}
