//
//  ExperienceReviewView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 27/10/22.
//

import SwiftUI

struct ExperienceReviewView: View {
    let model: ReviewModel
    //Prestar atenção pra ver se da pra salvar
    @State private var showPicture: Bool = false
    
    //se for diferente de nul = foto aparece, se não = foto não aparece (bool)
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ProfileImageView(model: model.user, size: 48)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("@" + model.user.username + " em " + model.location)
                            .font(.appHeadline)
                            .lineLimit(1)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: .leading)
                        
                        Spacer()
                        
                        HStack(spacing: 3) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(.appBlueButton)
                                .frame(width: 10, height: 10)
                            
                            Text("\(String(format: "%.1f", model.score))")
                                .font(.appCaption1)
                        }
                    }
                    
                    Text(model.text)
                        .font(.appSubheadline)
                        .lineLimit(3)
                    
                    HStack {
                        ForEach(0..<model.tags!.count, id: \.self) { index in
                            let item = model.tags![index]
                            TagDefaultView(model: item, isSelected: false)
                                .disabled(true)
                        }
                    }
                    
                    HStack {
                        ForEach(0..<model.images.count, id: \.self) { index in
                            let item = model.images[index]
                            ImageView(uiImage: item)
                        }
                    }
                    .padding(.top, 4)
                }
            }
    }
}

//@ViewBuilder



struct ExperienceReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceReviewView(model: ReviewModel.example2)
    }
}
