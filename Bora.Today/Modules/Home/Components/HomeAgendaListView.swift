//
//  HomeAgendaListView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 18/11/22.
//

import SwiftUI

struct HomeAgendaListView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    private let model: [ExperienceModel]
    
    //lista experiências do local - precisa chamar de outro lugar
    
    init() {
        model = [ExperienceModel.example1, ExperienceModel.example2, ExperienceModel.example3]
        
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("agendaTitle".localized(language))
                    .font(.appTitle3)
                    .foregroundColor(.appBlack)
                
                Text("yourScheduledExperiences".localized(language))
                    .font(.appFootnote)
                    .foregroundColor(.appBlack)
            }
            .padding(.bottom, 16)
            .padding(.horizontal, 21)
            
            LazyVStack(spacing: 12) {
                ForEach(0..<model.count) {index in
                    let item = model[index]
                    HomeAgendaItemView(model: item)
                }
            }
        }
    }
}

struct HomeAgendaListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAgendaListView()
    }
}
