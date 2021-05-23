//
//  APIError.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

enum APIError: Error {
  case general(errorMessage: String)
  case apiError(error: Error)
  case noInternetConnection(errorMessage: String)
}
