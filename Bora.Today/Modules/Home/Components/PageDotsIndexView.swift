//
//  Fancy3DotsIndexView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 05/10/22.
//

import SwiftUI

struct PageDotsIndexView: View {
    // MARK: - Public Properties
    
    let numberOfPages: Int
    let currentIndex: Int
    
    
    // MARK: - Drawing Constants
    
    private let circleSize: CGFloat = 6
    private let circleSpacing: CGFloat = 4
    
    private let primaryColor = Color.appAccent
    private let secondaryColor = Color.appGray
    
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { screen in
            HStack {
                HStack(spacing: circleSpacing) {
                    ForEach(0..<numberOfPages) { index in
                        Circle()
                            .fill(currentIndex == index ? primaryColor : secondaryColor)
                            .frame(width: circleSize, height: circleSize)
                            .transition(AnyTransition.opacity.combined(with: .scale))
                            .id(index)
                    }
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 7)
                .background(Color.gray.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 40))
            }
            .frame(width: screen.size.width, height: AppConfig.todayImageBannerHeight - 10, alignment: .bottom)
        }
    }
    
    
    // MARK: - Private Methods
    
    func shouldShowIndex(_ index: Int) -> Bool {
        ((currentIndex - 1)...(currentIndex + 1)).contains(index)
    }
}

struct PageDotsIndexView_Previews: PreviewProvider {
    static var previews: some View {
        PageDotsIndexView(numberOfPages: 3, currentIndex: 2)
    }
}
