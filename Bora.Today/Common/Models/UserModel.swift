//
//  UserModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let actualCity: String
    let username: String
    let image: String
    let originCountry: String
    let history: [HistoryCardModel] // Todo: isso vai mudar
}

#if DEBUG
// MARK: - Example Item
extension UserModel {
    
    static var example1: UserModel {

        UserModel(
            name: "Bruna",
            location: "lat/long",
            actualCity: "Curitiba, PR",
            username: "Broo",
            image: "today_bg",
            originCountry: "BR",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
        )
    }
    
    static var example2: UserModel {

        UserModel(
            name: "Deborah",
            location: "lat/long",
            actualCity: "São Paulo, SP",
            username: "Deh",
            image: "exp1",
            originCountry: "PT",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
        )
    }
    
    static var example3: UserModel {

        UserModel(
            name: "Jéssica",
            location: "lat/long",
            actualCity: "Rio de Janeiro, RJ",
            username: "Jess",
            image: "exp2",
            originCountry: "US",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
        )
    }
}
#endif
