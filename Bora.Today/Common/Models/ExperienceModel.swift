import Foundation

struct ExperienceModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var description: String
    let location: String
    let datetime: String
    let image: String
    let stickers: [StickerModel]?
}

// MARK: - Example Item
extension ExperienceModel {
    
    static var example1: ExperienceModel {

        ExperienceModel(
            name: "Rolê de Skate",
            description: "Reunião para treinar moviementos de skate e trocar conhecimentos sobre o esporte",
            location: "Praça do Atlético",
            datetime: "Hoje, 18:00 AM",
            image: "exp2",
            stickers: [StickerModel.irado, StickerModel.wow]
        )
    }
    
    static var example2: ExperienceModel {

        ExperienceModel(
            name: "Comemoração do Hexa",
            description: "Evento marcado desde já porque o hexa vai vir! Vamos todos comemorar a vitória do Brasil assistindo juntos ao jogo aproveiturando os apertivos e chop refil por 89,90 da promoção do Outback.",
            location: "Casa da Stel",
            datetime: "18/12/2022, 12:00 AM",
            image: "futbol",
            stickers: [StickerModel.bora,
                       StickerModel.wow,
                       StickerModel.top
                      ]
        )
    }
    
    static var example3: ExperienceModel {

        ExperienceModel(
            name: "Noite mexicana",
            description: "Uma noite mexicana para matar a saudade da nossa terra. Você que não é mexicano também está convidado! Bora compartilhar experiências? Cada um leva um prato ou bebida típica e nós dividimos enquanto ouvimos as melhores músicas e conversamos na nossa língua",
            location: "Praça central",
            datetime: "05/12/2022, 18:00 PM",
            image: "mexican",
            stickers: [StickerModel.bora,
                       StickerModel.hmmm,
                       StickerModel.delicia]
        )
    }
    
    static var example4: ExperienceModel {

        ExperienceModel(
            name: "Grupo de estudos: Freire",
            description: "Que tal conhecer um pouco mais sobre a vida e abordagens de Paulo Freire? Neste grupo de estudos leremos o livro Pedagogia do Oprimido como base para diversas disucussões decoloniais que podemos enxergar em vários âmbitos da nossa vida",
            location: "Sala C01 - UTFPR",
            datetime: "12/12/2022, 19:00 PM",
            image: "freire",
            stickers: [StickerModel.relax,
                       StickerModel.legal]
        )
    }
    
    static var example5: ExperienceModel {

        ExperienceModel(
            name: "Yoga no parque",
            description: "Eventro gratuito em prol da sua saúde física, mental e esperitual. Traga seu tapetinho e junte-se a nós",
            location: "Praça central",
            datetime: "23/12/2022, 20:00 PM",
            image: "yoga",
            stickers: [StickerModel.hmmm,
                       StickerModel.relax]
        )
    }
    
    static var example6: ExperienceModel {

        ExperienceModel(
            name: "Degustação de vinhos",
            description: "A arte de degustar um bom vinho abre infinitas possibilidades: sabores, aromas, países, uvas, regiões, harmonizações, entre muitas outras. Queremos compartilhar nossos conhecimentos com mais amantes de vinho neste encontro especial",
            location: "Vinicola do Paschoal",
            datetime: "23/12/2022, 20:00 PM",
            image: "today_bg",
            stickers: [StickerModel.delicia,
                       StickerModel.hmmm,
                       StickerModel.relax]
        )
    }
    
    static var example7: ExperienceModel {

        ExperienceModel(
            name: "Dança ao ar livre",
            description: "A dança é muito mais do que movimentos corporais: envolve nossa alma. Expressar-se desta forma tão íntima em meio à natureza torna esse momento ainda mais poderoso. Vamos juntos buscar este relaxamento a partir da dança",
            location: "Deck do lago",
            datetime: "10/12/2022, 14:00 PM",
            image: "exp1",
            stickers: [StickerModel.bora,
                       StickerModel.relax]
        )
    }
}
