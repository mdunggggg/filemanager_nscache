//
//  DownloadingImageViewModel.swift
//  IntermediateSwiftUi
//
//  Created by ImDung on 15/7/24.
//

import Foundation
import Combine

class DownloadingImageViewModel : ObservableObject {
    
    @Published var photos : [PhotoModel] = []
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubcribers()
    }
    
    func addSubcribers() {
        dataService.$photos
            .sink { [weak self] returnPhotos in
                self?.photos = returnPhotos
            }
            .store(in: &cancellables)
    }
    
 
}
