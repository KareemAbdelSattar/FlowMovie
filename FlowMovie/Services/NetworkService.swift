//
//  NetworkService.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//

import Alamofire

enum NetworkError: Error {
    case noConnection
    case failed
    case dataIsNil
    case notAuthentication
    case invalidResponse
    case emptyResult
}

class NetworkService {
    static let shared = NetworkService()
    
    func fetch<T : Decodable>(userRouter: URLRequestConvertible,completionHandler: @escaping (Result<T?, NetworkError>)->()){
        guard Connectivity.isConnectedToInternet() else { return  completionHandler(.failure(.noConnection)) }
        AF.request(userRouter).validate().responseData { responseData in

            guard responseData.response != nil else { return
                completionHandler(.failure(.invalidResponse))
            }

            switch responseData.result {
            case .success(let data):
                do{
                    let allItems = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(allItems))
                }catch{
                    completionHandler(.failure(.failed))
                }
            case .failure:
                completionHandler(.failure(.notAuthentication))
            }
        }
    }
}
