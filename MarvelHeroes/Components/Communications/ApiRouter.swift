//
//  ApiRouter.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import Alamofire

enum ApiVerb: String {
    case GET, POST, PUT, PATCH, DELETE
}

enum ApiError: Error {
    case badBaseUrl
}

protocol ApiCall {
    var path: String {get}
    var verb: ApiVerb {get}
    var params: [String: Any]? {get}
    var baseUrl: String {get}
    var extraHeaders: [String: String]? {get}
}

extension ApiCall {
    var extraHeaders: [String: String]? {nil}
}

internal extension ApiCall {
    func buildRequest() throws -> URLRequest {
        guard var url = URL(string: baseUrl) else {throw ApiError.badBaseUrl}
        
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = verb.rawValue
        
        extraHeaders?.forEach({
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        })
        
        let encoding: ParameterEncoding = URLEncoding.default
        
        return try encoding.encode(request, with: params)
    }
}

protocol ApiRouting {
    func request<T>(apiCall: ApiCall, _ completion: @escaping (Result<T, Error>) -> ()) where T : Decodable
    func request(apiCall: ApiCall, _ completion: @escaping (Error?) -> ())
}

class AFApiRouter {
    private let session: Session
    
    init(session: Session = Session.default) {
        self.session = session
    }
}

extension AFApiRouter: ApiRouting {
    func request<T>(apiCall: ApiCall, _ completion: @escaping (Result<T, Error>) -> ()) where T : Decodable {
        do {
            let request = try apiCall.buildRequest()
            session.request(request).responseDecodable {(dataResponse: DataResponse<T, AFError>) in
                completion(dataResponse.result.mapError({$0 as Error}))
            }.validate()
        } catch {
            completion(.failure(error))
        }
    }
    
    func request(apiCall: ApiCall, _ completion: @escaping (Error?) -> ()) {
        do {
            let request = try apiCall.buildRequest()
            session.request(request).response { (response) in
                completion(response.error)
            }.validate()
        } catch {
            completion(error)
        }
    }
}
