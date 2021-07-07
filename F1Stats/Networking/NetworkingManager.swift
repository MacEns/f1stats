//
//  NetworkManager.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-07-06.
//

import Foundation
import Combine

class NetworkingManager {
    
    
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({try handleURLResponse(output: $0) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }// download()
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }// check error
        return output.data
    }// handleURLResponse
    
    
}// NetworkingManager
