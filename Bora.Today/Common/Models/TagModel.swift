//
//  TagModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import Foundation
import SwiftUI

struct TagModel: Identifiable {
    let id = UUID()
    let text: String
    let icon: String?
    let color: Color
}

extension TagModel {
    // VIBE
    static var familia: TagModel {
        TagModel(
            text: "Família",
            icon: "sparkles",
            color: Color.appBlue
        )
    }
    
    static var amigos: TagModel {
        TagModel(
            text: "Amigos",
            icon: "sparkles",
            color: Color.appBlue
        )
    }
    
    static var romance: TagModel {
        TagModel(
            text: "Romance",
            icon: "sparkles",
            color: Color.appBlue
        )
    }
    
    static var independencia: TagModel {
        TagModel(
            text: "Independência",
            icon: "sparkles",
            color: Color.appBlue
        )
    }
    
    //ARTE E CULTURA
    static var danca: TagModel {
        TagModel(
            text: "Dança",
            icon: "theatermasks.fill",
            color: Color.appPink
        )
    }
    
    static var jogos: TagModel {
        TagModel(
            text: "Jogos",
            icon: "theatermasks.fill",
            color: Color.appPink
        )
    }
    
    static var musica: TagModel {
        TagModel(
            text: "Música",
            icon: "theatermasks.fill",
            color: Color.appPink
        )
    }
    
    static var linguagens: TagModel {
        TagModel(
            text: "Linguagens",
            icon: "theatermasks.fill",
            color: Color.appPink
        )
    }
    
    static var museus: TagModel {
        TagModel(
            text: "Museus",
            icon: "theatermasks.fill",
            color: Color.appPink
        )
    }
    
    //AVENTURAS
    static var arLivre: TagModel {
        TagModel(
            text: "Ar livre",
            icon: "bolt.fill",
            color: Color.appYellow
        )
    }
    
    static var passeios: TagModel {
        TagModel(
            text: "Passeios",
            icon: "bolt.fill",
            color: Color.appYellow
        )
    }
    
    static var natureza: TagModel {
        TagModel(
            text: "Natureza",
            icon: "bolt.fill",
            color: Color.appYellow
        )
    }
    
    static var adrenalina: TagModel {
        TagModel(
            text: "Adrenalina",
            icon: "bolt.fill",
            color: Color.appYellow
        )
    }
    
    static var parques: TagModel {
        TagModel(
            text: "Parques",
            icon: "bolt.fill",
            color: Color.appYellow
        )
    }
    
    //GASTRONOMIA
    static var comidas: TagModel {
        TagModel(
            text: "Comidas",
            icon: "fork.knife",
            color: Color.appOrange
        )
    }
    
    static var happyHour: TagModel {
        TagModel(
            text: "Happy Hour",
            icon: "fork.knife",
            color: Color.appOrange
        )
    }
    
    static var eventos: TagModel {
        TagModel(
            text: "Eventos",
            icon: "fork.knife",
            color: Color.appOrange
        )
    }
    
    static var noPrecinho: TagModel {
        TagModel(
            text: "No precinho",
            icon: "fork.knife",
            color: Color.appOrange
        )
    }
    
    static var bebidas: TagModel {
        TagModel(
            text: "Bebidas",
            icon: "fork.knife",
            color: Color.appOrange
        )
    }
    
    //BEM-ESTAR
    static var saude: TagModel {
        TagModel(
            text: "Saúde",
            icon: "camera.macro",
            color: Color.appGreen
        )
    }
    
    static var pets: TagModel {
        TagModel(
            text: "Pets",
            icon: "camera.macro",
            color: Color.appGreen
        )
    }
    
    static var hobbies: TagModel {
        TagModel(
            text: "Hobbies",
            icon: "camera.macro",
            color: Color.appGreen
        )
    }
    
    static var atividadeFísica: TagModel {
        TagModel(
            text: "Atividade Física",
            icon: "camera.macro",
            color: Color.appGreen
        )
    }
    
    static var espiritualidade: TagModel {
        TagModel(
            text: "Espiritualidade",
            icon: "camera.macro",
            color: Color.appGreen
        )
    }
    
    static var accessible: TagModel {
        TagModel(
            text: "Acessível",
            icon: nil,
            color: Color.red
        )
    }
    
    static var fun: TagModel {
        TagModel(
            text: "Divertido",
            icon: nil,
            color: Color.red
        )
    }
    
    static var cheap: TagModel {
        TagModel(
            text: "Barato",
            icon: nil,
            color: Color.red
        )
    }
}

#if DEBUG
// MARK: - Example Item
extension TagModel {
    
    static var example1: TagModel {

        TagModel(
            text: "Arte e Cultura",
            icon: "sparkles",
            color: Color.appOrange
        )
    }
    
    static var example2: TagModel {

        TagModel(
            text: "Happy Hour",
            icon: "fork.knife",
            color: Color.appPink
        )
    }
    
    static var example3: TagModel {

        TagModel(
            text: "Museus",
            icon: "theatermasks.fill",
            color: Color.appGreen
        )
    }
}
#endif
