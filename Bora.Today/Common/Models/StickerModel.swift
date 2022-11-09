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
            fontSize: 22,
            font: AppFont.palmerLakePrint,
            size: 44,
            fontColor: Color.white,
            bgColor: Color.appPink
        )
    }
    
    static var legal: StickerModel {

        StickerModel(
            text: "legal",
            fontSize: 16,
            font: AppFont.palmerLakeScript,
            size: 44,
            fontColor: Color.appBlack,
            bgColor: Color.appYellow
        )
    }
    
    static var bora: StickerModel {

        StickerModel(
            text: "BORA",
            fontSize: 22,
            font: AppFont.palmerLakePrint,
            size: 44,
            fontColor: Color.appWhite,
            bgColor: Color.appBlue
        )
    }
    
    static var irado: StickerModel {

        StickerModel(
            text: "irado",
            fontSize: 16,
            font: AppFont.palmerLakePrint,
            size: 44,
            fontColor: Color.appBlack,
            bgColor: Color.appYellow
        )
    }
    
    static var hmmm: StickerModel {

        StickerModel(
            text: "hmmm",
            fontSize: 20,
            font: AppFont.palmerLakePrint,
            size: 42,
            fontColor: Color.appWhite,
            bgColor: Color.appPink
        )
    }
    
    static var delicia: StickerModel {

        StickerModel(
            text: "delícia",
            fontSize: 16,
            font: AppFont.palmerLakePrint,
            size: 44,
            fontColor: Color.appWhite,
            bgColor: Color.appOrange
        )
    }
    
    static var fofo: StickerModel {

        StickerModel(
            text: "fofo",
            fontSize: 20,
            font: AppFont.palmerLakePrint,
            size: 44,
            fontColor: Color.appWhite,
            bgColor: Color.appOrange
        )
    }
    
    static var wow: StickerModel {

        StickerModel(
            text: "WOW",
            fontSize: 22,
            font: AppFont.palmerLakePrint,
            size: 44,
            fontColor: Color.appWhite,
            bgColor: Color.appGreen
        )
    }
    
    static var relax: StickerModel {

        StickerModel(
            text: "relax",
            fontSize: 16,
            font: AppFont.palmerLakePrint,
            size: 44,
            fontColor: Color.appWhite,
            bgColor: Color.appGreen
        )
    }
}
