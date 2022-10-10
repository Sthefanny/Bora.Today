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
            originCountry: "BR"
        )
    }
    
    static var example2: UserModel {

        UserModel(
            name: "Deborah",
            location: "lat/long",
            username: "Deh",
            image: "exp1",
            originCountry: "PT"
        )
    }
    
    static var example3: UserModel {

        UserModel(
            name: "Jéssica",
            location: "lat/long",
            username: "Jess",
            image: "exp2",
            originCountry: "US"
        )
    }
}
#endif
