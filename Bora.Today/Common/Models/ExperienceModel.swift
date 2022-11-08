import Foundation

struct ExperienceModel: Identifiable {
    let id = UUID()
    let name: String
    var description: String
    let location: String
    let datetime: String
    let image: String
    let stickers: [StickerModel]?
}

#if DEBUG
// MARK: - Example Item
extension ExperienceModel {
    
    static var example1: ExperienceModel {

        ExperienceModel(
            name: "Rolê de Skate",
            description: "Começa assim pra gente ter uma descrição antes de ter que colocar em todos hahaha teste isso aqui é um teste",
            location: "Condomínio Sachas",
            datetime: "Hoje, 18:00 AM",
            image: "today_bg",
            stickers: [StickerModel.legal, StickerModel.bora, StickerModel.top]
        )
    }
    
    static var example2: ExperienceModel {

        ExperienceModel(
            name: "Burguer na Stel",
            description: "Começa assim pra gente ter uma descrição antes de ter que colocar em todos hahaha teste isso aqui é um teste",
            location: "Casa da Stel",
            datetime: "12/10/2022, 18:00 AM",
            image: "exp1",
            stickers: [StickerModel.legal, StickerModel.top]
        )
    }
    
    static var example3: ExperienceModel {

        ExperienceModel(
            name: "Brooday",
            description: "Praesent in mauris eu tortor porttitor accumsan. Mauris suscipit, ligula sit amet pharetra semper, nibh ante cursus purus, vel sagittis velit mauris vel metus. Aenean fermentum risus id tortor. Integer",
            location: "Outback",
            datetime: "Amanha, 18:00 AM",
            image: "exp2",
            stickers: [StickerModel.top]
        )
    }
}
#endif
