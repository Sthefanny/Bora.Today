//
//  CreateEditExperienceModel.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 18/10/22.
//

import Foundation

struct CreateEditExperienceModel: Identifiable {
    let id = UUID()
    let selectedSticker: StickerModel
}

// MARK: - Example Item
extension CreateEditExperienceModel {
    
    static var example1: CreateEditExperienceModel {

        CreateEditExperienceModel(
            selectedSticker: StickerModel.bora

        )
    }
    
}
