//
//  APIMethod.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Alamofire

struct APIMethod: APIMethodProtocol {
  var path: String = Constants.emptyString
  var method: HTTPMethod = .get
  var parameters: Parameters?
  var encoding: ParameterEncoding = JSONEncoding.default
}
