//
//  PhotoPickerView.swift
//  PHPhotoPickerSwiftUI

import SwiftUI

struct PhotoPickerView: View {
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State private var photoPickerIsPresented = false
    @State var pickerResult: [UIImage] = []
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .center, spacing: 12){
                    ForEach(pickerResult, id: \.self) { uiImage in
                        ImageView(uiImage: uiImage)
                    }
                }
                .padding()
            }
            .navigationBarItems(leading: CreateImagePickerButton(buttonType: .imageAndTextBigger, text: "AddPic".localized(language), icon: "camera", action:{print("teste")}, isDisabled: .constant(false)))
            .sheet(isPresented: $photoPickerIsPresented) {
                PhotoPicker(pickerResult: $pickerResult,
                            isPresented: $photoPickerIsPresented)
            }
        }
    }
    
    @ViewBuilder
    private var selectPhotoButton: some View {
        Button(action: {
            photoPickerIsPresented = true
        }, label: {
            Label("Select", systemImage: "photo")
        })
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
