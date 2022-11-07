//
//  ExperienceReviewView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 27/10/22.
//

import SwiftUI

struct ExperienceReviewView: View {
    let model: ReviewModel
    @State private var showPicture: Bool = false
    
    //se for diferente de nul = foto aparece, se não = foto não aparece (bool)
    
    var body: some View {
                VStack {
                    HStack(alignment: .top) {
                        ProfileImageView(image: model.user.image, country: model.user.originCountry)
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text("@" + model.user.username + " em " + model.location)
                                    .font(.appHeadline)
                                
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
                                .lineLimit(3)
                                .font(.appSubheadline)
                            
                            HStack {
                                ForEach(0..<model.tags!.count, id: \.self) { index in
                                    let item = model.tags![index]
                                    TagDefaultView(model: TagModel(text: item, icon: "", color: Color.red), isSelected: false)
                                }
                            }
                        }
                    }
                }
                .frame(height: 131)
            }
        }


struct ExperienceReviewView_Previews: PreviewProvider {
    static var previews: some View {
                ExperienceReviewView(model: ReviewModel.example1)
    }
}
