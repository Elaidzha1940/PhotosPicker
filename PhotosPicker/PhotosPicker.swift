//  /*
//
//  Project: PhotosPicker
//  File: PhotosPicker.swift
//  Created by: Elaidzha Shchukin
//  Date: 10.01.2024
//
//  */

import SwiftUI
import PhotosUI

@MainActor
final class PhotosPickerViewModel: ObservableObject {
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil
}

struct PhotosPicker: View {
    @StateObject private var viewModel = PhotosPickerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hooo")
            
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .cornerRadius(15)
            }
            PhotosPicker(selection: $viewModel.imageSelection) {
                Text("Open the photo picker")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    PhotosPicker()
}
