//
//  CreatedExpView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 23/11/22.
//

import SwiftUI

struct CreatedExpView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    private var model: [ExperienceModel] = [
        .example1,
        .example2,
        .example3
    ]
    
    var body: some View {
        VStack {
            HeaderView(headerTitle: "createdTitle", showCreateButton: true)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(0..<model.count, id: \.self) { index in
                            let item = model[index]
                            HStack(spacing: 8) {
                                ExperienceCardView(model: item, isInDiscover: false, isSaved: false)
                            }
                            Divider()
                                .overlay(Color.appGray)
                        }
                    }
                }
                .padding(.vertical, 16)
            }
            .padding(.horizontal, AppConfig.safeAreaHorizontal)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CreatedExpView_Previews: PreviewProvider {
    static var previews: some View {
        CreatedExpView()
    }
}
