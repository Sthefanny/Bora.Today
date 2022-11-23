import Foundation

struct ExperienceModel: Identifiable {
    let id = UUID()
    let name: String
    var description: String
    let event: EventModel
    let image: String
    let stickers: [StickerModel]?
    let reviews: [ReviewModel]?
    let createdBy: UserModel
}

// MARK: - Example Item
extension ExperienceModel {
    
    static var example1: ExperienceModel {

        ExperienceModel(
            name: "Rolê de Skate",
            description: "Começa assim pra gente ter uma descrição antes de ter que colocar em todos hahaha teste isso aqui é um teste",
            event: EventModel.example1,
            image: "today_bg",
            stickers: [StickerModel.legal, StickerModel.bora, StickerModel.top],
            reviews: [ReviewModel.example1],
            createdBy: UserModel.example2
        )
    }
    
    static var example2: ExperienceModel {

        ExperienceModel(
            name: "Burguer na Stel",
            description: "Começa assim pra gente ter uma descrição antes de ter que colocar em todos hahaha teste isso aqui é um teste",
            event: EventModel.example2,
            image: "exp1",
            stickers: [StickerModel.legal, StickerModel.top],
            reviews: [ReviewModel.example2, ReviewModel.example3],
            createdBy: UserModel.example3
        )
    }
    
    static var example3: ExperienceModel {

        ExperienceModel(
            name: "Brooday",
            description: "Praesent in mauris eu tortor porttitor accumsan. Mauris suscipit, ligula sit amet pharetra semper, nibh ante cursus purus, vel sagittis velit mauris vel metus. Aenean fermentum risus id tortor. Integer vel sagittis velit mauris vel metus. Aenean fermentum risus id tortor.",
            event: EventModel.example3,
            image: "exp2",
            stickers: [StickerModel.top],
            reviews: [ReviewModel.example3, ReviewModel.example1, ReviewModel.example2],
            createdBy: UserModel.example1
        )
    }
}
