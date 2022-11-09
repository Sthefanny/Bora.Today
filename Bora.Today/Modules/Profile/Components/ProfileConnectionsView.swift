//
//  ProfileConnectionsView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 08/11/22.
//

import SwiftUI

struct ProfileConnectionsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0){
                Text("Conexões")
                    .font(.appHeadline)
                Spacer()
                HStack(spacing: 4) {
                    Text("20+")
                        .font(.appCallout)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 8, height: 8)
                }
                .foregroundColor(.appBlueButton)
            }
            .padding(.horizontal, AppConfig.safeAreaHorizontal)
            .padding(.bottom, 16)
            
            CreateUsersListView()
        }
    }
}

struct ProfileConnectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConnectionsView()
    }
}
