//
//  ImageLoadingViewModel.swift
//  IntermediateSwiftUi
//
//  Created by ImDung on 15/7/24.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel : ObservableObject {
    @Published var image : UIImage? = nil
    @Published var isLoading : Bool = false
    var cancellables = Set<AnyCancellable>()
    let urlString: String
    init(url : String) {
        urlString = url
        downloadImage()
    }
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map {
                UIImage(data: $0.data)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: {[weak self] image in
                self?.image = image
            }.store(in: &cancellables)
    }
    
}
