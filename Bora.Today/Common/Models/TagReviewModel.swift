//
//  TagModel.swift
//  Bora.Today
//
//  Created by Jessica Cansada Desesperada on 09/10/22.
//

import Foundation
import SwiftUI


struct TagReviewModel: Identifiable {
    let id = UUID()
    let text: String
    let icon: String?
    let color: Color
}

extension TagReviewModel {

//Positivo
    static var beneficioPositivo: TagModel {
        TagModel(
            text: "Custo Benefício",
            icon: "arrow.up",
            color: Color.appGreen
        )
    }
    
    static var ambientePositivo: TagModel {
        TagModel(
            text: "Ambiente",
            icon: "arrow.up",
            color: Color.appOrange
        )
    }
    
    static var acessibilidadePositivo: TagModel {
        TagModel(
            text: "Acessibilidade",
            icon: "arrow.up",
            color: Color.appYellow
        )
    }
    
    static var segurancaPositivo: TagModel {
        TagModel(
            text: "Segurança",
            icon: "arrow.up",
            color: Color.appRed
        )
    }
    
    static var organizacaoPositivo: TagModel {
        TagModel(
            text: "Organização",
            icon: "arrow.up",
            color: Color.appPink
        )
    }
    
    //Negativo
    static var beneficioNegativo: TagModel {
        TagModel(
            text: "Família",
            icon: "arrow.down",
            color: Color.appGreen
        )
    }
    
    static var ambienteNegativo: TagModel {
        TagModel(
            text: "Amigos",
            icon: "arrow.up",
            color: Color.appOrange
        )
    }
    
    static var acessibilidadeNegativo: TagModel {
        TagModel(
            text: "Romance",
            icon: "arrow.down",
            color: Color.appYellow
        )
    }
    
    static var segurancaNegativo: TagModel {
        TagModel(
            text: "Independência",
            icon: "arrow.down",
            color: Color.appRed
        )
    }
    
    static var organizacaoNegativo: TagModel {
        TagModel(
            text: "Dança",
            icon: "arrow.down",
            color: Color.appPink
        )
    }
}

#if DEBUG
// MARK: - Example Item
extension TagReviewModel {
    
    static var example1: TagReviewModel {

        TagReviewModel(
            text: "Custo Benefício",
            icon: "arrow.up",
            color: Color.appGreen
        )
    }
    
    static var example2: TagReviewModel {

        TagReviewModel(
            text: "Ambiente",
            icon: "arrow.up",
            color: Color.appOrange
        )
    }
    
    static var example3: TagReviewModel {

        TagReviewModel(
            text: "Independência",
            icon: "arrow.down",
            color: Color.appRed
        )
    }
}
#endif
