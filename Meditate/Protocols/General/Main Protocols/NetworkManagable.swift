//
//  NetworkManagable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

protocol NetworkManagable {
  func request<T: Decodable>(_ apiRoute: APIMethodProtocol,
                             response: @escaping (APIResult<T>) -> Void)
}
