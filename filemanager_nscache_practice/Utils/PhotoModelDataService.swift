//
//  PhotoModelDataService.swift
//  IntermediateSwiftUi
//
//  Created by ImDung on 15/7/24.
//

import Foundation
import Combine

class PhotoModelDataService {
    static let instance = PhotoModelDataService()
    var cancellables = Set<AnyCancellable>()
    @Published var photos : [PhotoModel] = []
    private init(){
        downloadData()
    }
    
    func downloadData(){
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/photos") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch(completion){
                case .finished:
                    print("finish")
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] data in
                self?.photos = data
            }
            .store(in: &cancellables)
    }
    private func handleOutput(output : URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    
}
