//
//  APIMethodProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Alamofire

protocol APIMethodProtocol: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension APIMethodProtocol {
  var baseURL: String { return Constants.URLs.baseURL }
  
  func asURLRequest() throws -> URLRequest {
    let url = try baseURL.asURL().appendingPathComponent(path)
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    return try encoding.encode(urlRequest, with: parameters)
  }
}
