//
//  PhotoPickerView.swift
//  PHPhotoPickerSwiftUI

import SwiftUI

struct PhotoPickerView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State private var photoPickerIsPresented = false
    @State var pickerResult: [UIImage] = []
    
    var body: some View {
        GeometryReader { screen in
            HStack (alignment: .center, spacing: 12){
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (alignment: .center, spacing: 12){
                        ForEach(pickerResult, id: \.self) { uiImage in
                            ImageView(uiImage: uiImage)
                        }
                    }
                    .padding()
                }
                .edgesIgnoringSafeArea(.bottom)
                selectPhotoButton
                    .sheet(isPresented: $photoPickerIsPresented) {
                        PhotoPicker(pickerResult: $pickerResult,
                                    isPresented: $photoPickerIsPresented)
                    }
                    .frame(width: screen.size.width, alignment: .center)
            }
        }
    }
    
    @ViewBuilder
    private var selectPhotoButton: some View {
        Button(action: {
            photoPickerIsPresented = true
        }, label: {
            VStack (alignment: .center, spacing: 8){
                Image(systemName: "camera")
                Text("Adicionar Image")
                    .font(.appButtonText)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 85, height: 85)
            .padding(8)
            .foregroundColor(.appWhite)
            .background(Color.appBlueButton)
            .cornerRadius(18)
        })
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
