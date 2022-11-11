//
//  ReviewRatingView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 10/11/22.
//

import SwiftUI

struct ReviewRatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        Section {
        RatingView(rating: $rating)
        }
    }
}

struct ReviewRatingView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewRatingView(rating: .constant(3))
    }
}
