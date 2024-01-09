//  /*
//
//  Project: c
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
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
//            if let data = try? await selection.loadTransferable(type: Data.self) {
//                if let uiImage = UIImage(data: data) {
//                    selectedImage = uiImage
//                    return
//                }
//            }
            
            do {
                let data = try? await selection.loadTransferable(type: Data.self)
                guard let data, let uiImage = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                selectedImage = uiImage
            } catch {
                print(error)
            }
            
        }
    }
}

struct PhotosPickerView: View {
    @StateObject private var viewModel = PhotosPickerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            //Text("Hooo")
            
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .frame(width: 250, height: 250)
            }
            
            PhotosPicker(selection: $viewModel.imageSelection) {
                Text("Open the photo picker")
                    .font(.system(size: 25, weight: .bold, design: .monospaced))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    PhotosPickerView()
        .preferredColorScheme(.dark)
}

