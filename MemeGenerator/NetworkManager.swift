//
//  Network.swift
//  MemeGenerator
//
//  Created by Aizada on 22.09.2023.
//

import Alamofire

class NetworkManager {
    static func createMeme(request: MemeRequest, completion: @escaping (Result<MemeResponse, Error>) -> Void) {
        let url = "https://apimeme.com"
        
        AF.request(url, method: .get, parameters: request, encoder: JSONParameterEncoder.default).responseDecodable(of: MemeResponse.self) { response in
            switch response.result {
            case .success(let memeResponse):
                completion(.success(memeResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
