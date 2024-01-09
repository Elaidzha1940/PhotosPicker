How to use PhotosPicker in SwiftUI & PhotosUI.
==============================================

Here's how to effectively use the PhotosPicker in SwiftUI with the power of PhotosUI framework:
-----------------------------------------------------------------------------------------------

https://github.com/Elaidzha1940/PhotosPicker/assets/64445918/5b749039-eaee-4f4c-a956-b34d90e20e4e

Task:
-----

``````ruby

 Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
``````

do-catch statement:
-------------------

````````ruby

 Task {
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
````````
