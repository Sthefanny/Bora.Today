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
    let username: String
    let image: String
    let originCountry: String
    let tags: [TagModel]?
    let bio: String
}

#if DEBUG
// MARK: - Example Item
extension UserModel {
    
    static var example1: UserModel {

        UserModel(
            name: "Bruna",
            location: "lat/long",
            username: "Broo",
            image: "today_bg",
            originCountry: "BR",
            tags: [TagModel.espiritualidade, TagModel.hobbies, TagModel.happyHour],
            bio: "Morando no centrão de Curitiba há 1 ano. Sou de portugal e amo um role cultura com novas pessoas, bora se encontrar e formar novas experiênciasl! ✨🥰🌏🇧🇷"
        )
    }
    
    static var example2: UserModel {

        UserModel(
            name: "Deborah",
            location: "lat/long",
            username: "Deh",
            image: "exp1",
            originCountry: "PT",
            tags: [],
            bio: "Morando no centrão de Curitiba há 1 ano. Sou de portugal e amo um role cultura com novas pessoas, bora se encontrar e formar novas experiênciasl! ✨🥰🌏🇧🇷"
        )
    }
    
    static var example3: UserModel {

        UserModel(
            name: "Jéssica",
            location: "lat/long",
            username: "Jess",
            image: "exp2",
            originCountry: "US",
            tags: [TagModel.adrenalina, TagModel.natureza, TagModel.museus],
            bio: "Morando no centrão de Curitiba há 1 ano. Sou de portugal e amo um role cultura com novas pessoas, bora se encontrar e formar novas experiênciasl! ✨🥰🌏🇧🇷"
        )
    }
}
#endif
