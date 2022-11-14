//
//  FontSystem.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 30/09/22.
//

import Foundation
import SwiftUI

extension Font {
    static func appFont(size: CGFloat) -> Font {
        return Font.custom(AppFont.figtree.name, size: size)
    }
    
    static let appLargeTitle = appFont(size: 34).weight(.regular)
    static let appTitle1 = appFont(size: 28).weight(.semibold)
    static let appTitle2 = appFont(size: 22).weight(.semibold)
    static let appTitle3 = appFont(size: 20).weight(.semibold)
    static let appHeadline = appFont(size: 17).weight(.semibold)
    static let appBody = appFont(size: 17).weight(.regular)
    static let appCallout = appFont(size: 15).weight(.medium)
    static let appSubheadline = appFont(size: 15).weight(.regular)
    static let appFootnote = appFont(size: 13).weight(.regular)
    static let appCaption1 = appFont(size: 12).weight(.regular)
    static let appCaption2 = appFont(size: 11).weight(.regular)
    static let appLink = appFont(size: 10).weight(.regular)
    static let appButtonText = appFont(size: 16).weight(.semibold)
}


//struct FontSystem: ViewModifier {
//
//    @Environment(\.sizeCategory) var sizeCategory
//
//    public enum TextStyle {
//        case largeTitle //Figtree, 34pt, Regular
//        case title1 //Figtree, 28pt, Regular
//        case title2 //Figtree, 22pt, Regular
//        case title3 //Figtree, 20pt, Regular
//        case headline //Figtree, 17pt, Semibold
//        case body //Figtree, 17pt, Regular
//        case callout //Figtree, 16pt, Regular
//        case subheadline //Figtree, 15pt, Regular
//        case footnote //Figtree, 13pt, Regular
//        case caption1 //Figtree, 12pt, Regular
//        case caption2 //Figtree, 11pt, Regular
//        case link //Figtree, 10pt, Bold
//        case buttonText //Figtree, 16pt, Semibold
//    }
//
//    var textStyle: TextStyle
//    var textSize: CGFloat?
//
//    func body(content: Content) -> some View {
//       let scaledSize = UIFontMetrics.default.scaledValue(for: textSize ?? size)
//       return content.font(.custom(fontName, size: scaledSize))
//    }
//
//    private var fontName: String {
//        switch textStyle {
//        default:
//            return AppFont.figtree.rawValue
//        }
//    }
//
//    private var size: CGFloat {
//        switch textStyle {
//        case .largeTitle:
//            return 34
//        case .title1:
//            return 28
//        case .title2:
//            return 22
//        case .title3:
//            return 20
//        case .headline, .body:
//            return 17
//        case .callout, .buttonText:
//            return 16
//        case .subheadline:
//            return 15
//        case .footnote:
//            return 13
//        case .caption1:
//            return 12
//        case .caption2:
//            return 11
//        case .link:
//            return 10
//        }
//    }
//}
//
//extension View {
//
//    func appFont(_ textStyle: FontSystem.TextStyle, textSize: CGFloat? = nil) -> some View {
//        self.modifier(FontSystem(textStyle: textStyle, textSize: textSize))
//    }
//}
