//
//  MovieRouter.swift
//  FlowMovie
//
//  Created by kareem chetoos on 24/11/2022.
//

import Alamofire

//https://api.themoviedb.org/3/movie/436270/api_key=0425e4dd3a72f831dcf6cfa456d256c2
//https://api.themoviedb.org/3/movie/436270?api_key=0425e4dd3a72f831dcf6cfa456d256c2&language=en-US
enum MovieRouter: URLRequestConvertible {
    
    case popularMovies(page: Int)
    case movieDetails(movieId: Int)
    
    var method: Alamofire.HTTPMethod{
        return .get
    }
    
    var path: String{
        switch self {
        case .popularMovies(let page):
            return "popular?api_key=0425e4dd3a72f831dcf6cfa456d256c2&page=\(page)"
        case .movieDetails(let movieId):
            return "\(movieId)?api_key=0425e4dd3a72f831dcf6cfa456d256c2"
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.baseURL.asURL()
        let urlWithPath = (try url.appendingPathComponent(path).absoluteString.removingPercentEncoding?.asURL())!
        var urlRequest = URLRequest(url: urlWithPath)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = TimeInterval(10*1000)
        return urlRequest
    }
    
    
}
