//
//  CreateReviewImage.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 27/10/22.
//

import SwiftUI

struct CreateReviewImage: View {
//    @State var images: [UIImage]
    
    var body: some View {
        HStack (alignment: .center, spacing: 12){
            
            Button(action: {}) {
                //esse botão precisa abrir a foto maior (PHOTO PICKER)
            Image("today_bg")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .cornerRadius(18)
            }
        }
    }
}

struct CreateReviewImage_Previews: PreviewProvider {
    static var previews: some View {
        CreateReviewImage()
    }
}
