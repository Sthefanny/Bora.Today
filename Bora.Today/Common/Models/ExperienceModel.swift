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
    let isSaved: Bool
}

// MARK: - Example Item
extension ExperienceModel {
    
    static var example1: ExperienceModel {

        ExperienceModel(
            name: "Rolê de Skate",
            description: "Reunião para treinar moviementos de skate e trocar conhecimentos sobre o esporte",
            event: EventModel.example1,
            image: "exp2",
            stickers: [StickerModel.irado, StickerModel.wow],
            reviews: [ReviewModel.example1],
            createdBy: UserModel.example2,
            isSaved: false
        )
    }
    
    static var example2: ExperienceModel {

        ExperienceModel(
            name: "Comemoração do Hexa",
            description: "Evento marcado desde já porque o hexa vai vir! Vamos todos comemorar a vitória do Brasil assistindo juntos ao jogo aproveiturando os apertivos e chop refil por 89,90 da promoção do Outback.",
            event: EventModel.example2,
            image: "futbol",
            stickers: [StickerModel.bora,
                       StickerModel.wow,
                       StickerModel.top
                      ],
            reviews: [ReviewModel.example2, ReviewModel.example3],
            createdBy: UserModel.example3,
            isSaved: true
        )
    }
    
    static var example3: ExperienceModel {

        ExperienceModel(
            name: "Noite mexicana",
            description: "Uma noite mexicana para matar a saudade da nossa terra. Você que não é mexicano também está convidado! Bora compartilhar experiências? Cada um leva um prato ou bebida típica e nós dividimos enquanto ouvimos as melhores músicas e conversamos na nossa língua",
            event: EventModel.example3,
            image: "mexican",
            stickers: [StickerModel.bora,
                       StickerModel.hmmm,
                       StickerModel.delicia],
            reviews: [ReviewModel.example3, ReviewModel.example1, ReviewModel.example2],
            createdBy: UserModel.example1,
            isSaved: false
        )
    }
    
    static var example4: ExperienceModel {

        ExperienceModel(
            name: "Grupo de estudos: Freire",
            description: "Que tal conhecer um pouco mais sobre a vida e abordagens de Paulo Freire? Neste grupo de estudos leremos o livro Pedagogia do Oprimido como base para diversas disucussões decoloniais que podemos enxergar em vários âmbitos da nossa vida",
            event: EventModel.example3,
            image: "freire",
            stickers: [StickerModel.relax,
                       StickerModel.legal],
            reviews: [ReviewModel.example3, ReviewModel.example1, ReviewModel.example2],
            createdBy: UserModel.example1,
            isSaved: false
        )
    }
    
    static var example5: ExperienceModel {

        ExperienceModel(
            name: "Yoga no parque",
            description: "Eventro gratuito em prol da sua saúde física, mental e esperitual. Traga seu tapetinho e junte-se a nós",
            event: EventModel.example3,
            image: "yoga",
            stickers: [StickerModel.hmmm,
                       StickerModel.relax],
            reviews: [ReviewModel.example3, ReviewModel.example1, ReviewModel.example2],
            createdBy: UserModel.example1,
            isSaved: true
        )
    }
    
    static var example6: ExperienceModel {

        ExperienceModel(
            name: "Degustação de vinhos",
            description: "A arte de degustar um bom vinho abre infinitas possibilidades: sabores, aromas, países, uvas, regiões, harmonizações, entre muitas outras. Queremos compartilhar nossos conhecimentos com mais amantes de vinho neste encontro especial",
            event: EventModel.example3,
            image: "today_bg",
            stickers: [StickerModel.delicia,
                       StickerModel.hmmm,
                       StickerModel.relax],
            reviews: [ReviewModel.example3, ReviewModel.example1, ReviewModel.example2],
            createdBy: UserModel.example1,
            isSaved: true
        )
    }
    
    static var example7: ExperienceModel {

        ExperienceModel(
            name: "Dança ao ar livre",
            description: "A dança é muito mais do que movimentos corporais: envolve nossa alma. Expressar-se desta forma tão íntima em meio à natureza torna esse momento ainda mais poderoso. Vamos juntos buscar este relaxamento a partir da dança",
            event: EventModel.example3,
            image: "exp1",
            stickers: [StickerModel.bora],
            reviews: [ReviewModel.example3, ReviewModel.example1, ReviewModel.example2],
            createdBy: UserModel.example1,
            isSaved: false
        )
    }
}
