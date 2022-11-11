//
//  ReviewRatingView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 10/11/22.
//

import SwiftUI

struct ReviewRatingView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var rating: Int
    
    var body: some View {
        
        VStack {
            
            //Adicionar componente de Card da Lari na View -
            
            Section {
                RatingView(rating: $rating)
                //se o rating é maior que 3 - tagsReview positivas, se menor que 3, tagsReview negativas.
            }
            
            //Adicionar componente TextField da Lari
            PhotoPickerView()
            
            //Adicionar TagReviewModel
            
            ButtonDefault(buttonType: .textOnly, text: "publishReview".localized(language), icon: "record.circle", action: {print("teste")}, isDisabled: .constant(false))
        }
    }
}

struct ReviewRatingView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewRatingView(rating: .constant(3))
    }
}
