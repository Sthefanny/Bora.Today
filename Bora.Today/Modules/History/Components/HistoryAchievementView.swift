//
//  HistoryAchievementView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 20/10/22.
//

import SwiftUI

struct HistoryAchievementView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var model: [AchievementModel]
    
    init() {
        self.model = [AchievementModel.example1, AchievementModel.example2, AchievementModel.example3]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("yourAchievements".localized(language))
                .font(.appHeadline)
                .fontWeight(.bold)
                .padding(.leading, 21)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<model.count, id: \.self) { index in
                        let item = model[index]
                        _buildCard(item: item)
                            .padding(.leading, index == 0 ? 21 : 0)
                            .padding(.trailing, index == model.count - 1 ? 21 : 0)
                    }
                }
            }
            .padding(.top, 16)
        }
    }
    
    private func _buildCard(item: AchievementModel) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(item.image)
                .cornerRadius(18)
            
            Text(item.date)
                .font(.appCaption1)
                .foregroundColor(.appBlack)
        }
    }
}

struct HistoryAchievementView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryAchievementView()
    }
}
