//
//  LocalExperienceListView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 09/11/22.
//

import SwiftUI

struct LocalExperienceListView: View {
    
    private let model: [ExperienceModel]
    
    //lista experiências do local - precisa chamar de outro lugar
    
    init() {
        model = [ExperienceModel.example1, ExperienceModel.example2, ExperienceModel.example3]
        
    }
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                CreateExperienceCornerButton(text: "Create Experience", icon: "createIcon2")
                
                ForEach(0..<model.count) {index in
                    let item = model[index]
                    ExperienceCardOnMapView(model: item)
                }
            }
        }
        .frame(height: 125)
    }
}

struct LocalExperienceListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            LocalExperienceListView()
        }
    }
}
