//
//  StickerModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 06/10/22.
//

import Foundation
import SwiftUI

struct StickerModel: Hashable {
    let text: String
    let fontSize: CGFloat
    let font: AppFont
    let size: CGFloat
    let fontColor: Color
    var bgColor: Color
}

extension StickerModel {
    
    static var top: StickerModel {

        StickerModel(
            text: "TOP",
            fontSize: 32,
            font: AppFont.palmerLakePrint,
            size: 42,
            fontColor: Color.white,
            bgColor: Color.appRed
        )
    }
    
    static var legal: StickerModel {

        StickerModel(
            text: "legal",
            fontSize: 20,
            font: AppFont.palmerLakeScript,
            size: 42,
            fontColor: Color.white,
            bgColor: Color.appGreen
        )
    }
    
    static var bora: StickerModel {

        StickerModel(
            text: "BORA?",
            fontSize: 25,
            font: AppFont.palmerLakePrint,
            size: 42,
            fontColor: Color.white,
            bgColor: Color.appBlue
        )
    }
    
    static var irado: StickerModel {

        StickerModel(
            text: "IRADO!",
            fontSize: 20,
            font: AppFont.palmerLakePrint,
            size: 42,
            fontColor: Color.appBlack,
            bgColor: Color.appYellow
        )
    }
    
    static var delicia: StickerModel {

        StickerModel(
            text: "DELÍCIA",
            fontSize: 20,
            font: AppFont.palmerLakePrint,
            size: 42,
            fontColor: Color.white,
            bgColor: Color.appPink
        )
    }
}
