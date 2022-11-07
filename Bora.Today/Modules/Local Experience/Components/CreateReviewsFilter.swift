////
////  CreateReviewsFilter.swift
////  Bora.Today
////
////  Created by Jessica Akemi Meguro on 07/11/22.
////
//
//import SwiftUI
//
//DE RUIM, DEPOIS EU ARRUMO

//struct CreateReviewsFilter: View {
//
//    @StateObject var locationManager = LocationManager()
//
//    @AppStorage("language")
//    private var language = LocalizationManager.shared.language
//
//    @State var color: Color
//    @Binding var isSelected: Bool
//    @State var title: String
//
//    var body: some View {
//       Text("Bora")
//        .background(RoundedRectangle(
//            cornerRadius(18),
//            style: .continuous
//        )
//            .strokeBorder(Color.appBlueButtonDisabled)
//            .background(Color.appBlueButtonStrokeDisabled)
//            .cornerRadius(18))
//    }
//}
//
//struct CreateReviewsFilter_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateReviewsFilter(color: .appBlueButton, isSelected: .constant(true),title: "all")
//    }
//}
