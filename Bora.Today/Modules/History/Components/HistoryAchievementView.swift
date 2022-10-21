//
//  HistoryAchievementView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 20/10/22.
//

import SwiftUI

struct HistoryAchievementView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Image("achiev1")
        }
        .padding(.top, 24)
        .padding(.bottom, 12)
        .padding(.horizontal, 12)
        .cornerRadius(18)
    }
}

struct HistoryAchievementView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryAchievementView()
    }
}
