//
//  APIResult.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

enum APIResult<T> {
  case success(T)
  case failure(APIError)
}
