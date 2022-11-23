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
    let actualCity: String
    let username: String
    let image: String
    let originCountry: String
    let tags: [TagModel]?
    let bio: String
    let history: [HistoryCardModel] // Todo: isso vai mudar
//    let experiencesGone: [ExperienceModel]?
}

// MARK: - Example Item
extension UserModel {
    
    static var example1: UserModel {

        UserModel(
            name: "Ana Stege",
            location: "lat/long",
            actualCity: "Curitiba, PR",
            username: "ana.stege",
            image: "ana",
            originCountry: "FR",
            tags: [TagModel.familia, TagModel.comidas, TagModel.jogos],
            bio: "Estudante de Design na UFPR, cria de Curitiba, estou sempre afim de um buffet de pastel, sorvetinho no shopping e jogos para relaxar 🕶️",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
//            ,experiencesGone: [ExperienceModel.example2]
        )
    }
    
    static var example2: UserModel {

        UserModel(
            name: "Barbra Eliza",
            location: "lat/long",
            actualCity: "Curitiba, PR",
            username: "barbraeliza",
            image: "barbra",
            originCountry: "SE",
            tags: [TagModel.jogos,
                   TagModel.hobbies,
                   TagModel.natureza
                  ],
            bio: "Micreira Senior, atualmente moro em Curitiba e curto a falta de sol daqui. Em um momento de transição de ciclos, tô em busca de novos hobbies e aventuras ☂️",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
//            ,experiencesGone: [ExperienceModel.example1, ExperienceModel.example3]
        )
    }
    
    static var example3: UserModel {

        UserModel(
            name: "Broona Martins",
            location: "lat/long",
            actualCity: "Curitiba, PR",
            username: "bru_martinso",
            image: "broona",
            originCountry: "US",
            tags: [TagModel.amigos, TagModel.happyHour, TagModel.pets],
            bio: "Uma sorocabana lutando em Curitiba até chegar a hora de viver o sonho em NY. To sempre on para passeios, feirinhas, eventos (principalmente que tenham flash Tattoos) ❤️‍🔥",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
        )
    }
    
    static var example4: UserModel {

        UserModel(
            name: "Deborah Eberle",
            location: "lat/long",
            actualCity: "São José dos Campos, SP",
            username: "deh_eberle",
            image: "deb",
            originCountry: "GB",
            tags: [TagModel.musica, TagModel.museus, TagModel.natureza],
            bio: "Aspirante a hippie, meu sonho é morar no meio do mato e mochilar pelo mundo inteiro com minha câmera analógica coletando histórias 🍀",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
        )
    }
    
    static var example5: UserModel {

        UserModel(
            name: "Jessie Meguro",
            location: "lat/long",
            actualCity: "Curitiba, PR",
            username: "jessiemeguro",
            image: "jessie",
            originCountry: "JP",
            tags: [TagModel.danca, TagModel.passeios, TagModel.espiritualidade],
            bio: "Curiosa & engajada. Adoro aprender coisas novas e compartilhar minhas experiências. Estou em busca de companhias para cafézinhos com boas conversas ☕️",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
        )
    }
    
    static var example6: UserModel {

        UserModel(
            name: "Larissa Paschoalin",
            location: "lat/long",
            actualCity: "Engenheiro Beltrão, PR",
            username: "laripaschoalin",
            image: "lari",
            originCountry: "BR",
            tags: [TagModel.romance, TagModel.museus, TagModel.comidas],
            bio: "Designer e mestranda em busca de experiências para matar a saudade de casa ✨",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
        )
    }
    
    static var example7: UserModel {

        UserModel(
            name: "Sthefanny Gonzaga",
            location: "lat/long",
            actualCity: "Rio de Janeiro, RJ",
            username: "stelbyrn",
            image: "stel",
            originCountry: "IE",
            tags: [TagModel.jogos, TagModel.atividadeFísica, TagModel.pets],
            bio: "Uma desenvolvedora apaixonada por Flutter e uma ex-streamer que ama jogar. Adoro rolês mais tranquilos que envolvam comida boa, rock e jogos com os amigos 👾",
            history: [HistoryCardModel.example1, HistoryCardModel.example2, HistoryCardModel.example3]
//            ,experiencesGone: [ExperienceModel.example3]
        )
    }
}
