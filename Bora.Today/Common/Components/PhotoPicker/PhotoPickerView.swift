//
//  PhotoPickerView.swift
//  PHPhotoPickerSwiftUI

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @Binding var selectedImages: [UIImage]
    
    var maxSelectionCount: Int = 1
    
    var isCover: Bool
    
    var body: some View {
        VStack (alignment: .center, spacing: 12){
            
            
            PhotosPicker(selection: $selectedItems, maxSelectionCount: maxSelectionCount, matching: .images) {
                if isCover {
                    if selectedImages.count > 0 {
                        Image(uiImage: selectedImages[0])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 42, height: 240)
                    } else {
                        bigPhotoButton
                    }
                } else {
                    if selectedImages.count > 0 {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(selectedImages, id: \.self) { img in
                                    Image(uiImage: img)
                                        .resizable()
                                        .frame(width: 85, height: 85)
                                }
                            }
                        }
                    } else {
                        smallPhotoButton
                    }
                }
            }
            .onChange(of: selectedItems) { newValues in
                Task {
                    selectedImages = []
                    for value in newValues {
                        if let imageData = try? await value.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                            selectedImages.append(image)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var smallPhotoButton: some View {
        VStack (alignment: .center, spacing: 8){
            Image(systemName: "camera")
            Text("addImage".localized(language))
                .font(.appButtonText)
                .multilineTextAlignment(.center)
        }
        .frame(width: 85, height: 85)
        .padding(8)
        .foregroundColor(.appWhite)
        .background(Color.appBlueButton)
        .cornerRadius(18)
    }
    
    @ViewBuilder
    private var bigPhotoButton: some View {
        VStack (alignment: .center, spacing: 8){
            Image(systemName: "camera")
            Text("addCoverImage".localized(language))
                .font(.appButtonText)
                .multilineTextAlignment(.center)
        }
        .frame(width: UIScreen.main.bounds.width - 42, height: 240)
        .padding(8)
        .foregroundColor(.appWhite)
        .background(Color.appBlueButton)
        .cornerRadius(18)
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView(selectedImages: .constant([]), maxSelectionCount: 1, isCover: false)
    }
}
