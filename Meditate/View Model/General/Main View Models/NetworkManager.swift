//
//  NetworkManager.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Alamofire

class NetworkManager: NetworkManagable {
  // MARK: - Variables
  private var reachabilityManager: NetworkReachabilityManager? = NetworkReachabilityManager()
  
  // MARK: - Request
  func request<T: Decodable>(_ apiRoute: APIMethodProtocol,
                             response: @escaping (APIResult<T>) -> Void) {
    
    let dataRequest = AF.request(apiRoute)
    dataRequest.responseDecodable(completionHandler: self.transform(T.self, response))

  }
  
  
  // MARK: - Request Handling
  /// This method transforms AF's result type to ours
  func transform<T: Decodable>(_ type: T.Type, _ response: @escaping (APIResult<T>) -> Void) -> (AFDataResponse<T>) -> Void {
    return { [weak self] result in
      self?.map(result, of: T.self, response)
    }
  }
  
  func map<T: Decodable>(_ result: AFDataResponse<T>, of type: T.Type, _ response: @escaping (APIResult<T>) -> Void) {
    response(process(result, ofType: type))
  }

  func process<T: Decodable>(_ result: AFDataResponse<T>, ofType type: T.Type) -> APIResult<T> {
    
    switch result.result {
    case .success(let response):
      return APIResult<T>.success(response)
    case .failure(let error):
      if reachabilityManager?.isReachable == false {
        return APIResult.failure(.noInternetConnection(errorMessage: "Could not connect to network"))
      }
      return APIResult.failure(.general(errorMessage: "Could not get the result from the performed request. ERROR: \(error)"))
    }
  }
}

import UIKit

struct ErrorLogger {
  enum UIError {
    case couldNotDefineController(identifier: String)
    case cellCouldNotBeCreated(className: String)
    case cellConfigureError(viewModelName: String)
    case couldNotObtainOrientation
    
    func errorMessage(methodName: String, fileName: String, errorDescription: String = Constants.emptyString) -> String {
      switch self {
      case .couldNotDefineController(let identifier):
        return "\(ErrorLogger.errorHeader) Could not define view controller with identifier: \(identifier) \(ErrorLogger.errorLocation(methodName: methodName, fileName: fileName, errorDescription: errorDescription))"
      case .cellCouldNotBeCreated(let className):
        return "\(ErrorLogger.errorHeader) \(className) could not be created \(ErrorLogger.errorLocation(methodName: methodName, fileName: fileName, errorDescription: errorDescription))"
      case .cellConfigureError(let viewModelName):
        return "\(ErrorLogger.errorHeader) Error while configuring \(viewModelName)  \(ErrorLogger.errorLocation(methodName: methodName, fileName: fileName, errorDescription: errorDescription))"
      case .couldNotObtainOrientation:
        return "\(ErrorLogger.errorHeader) Could not obtain UIInterfaceOrientation from a valid windowScene \(ErrorLogger.errorLocation(methodName: methodName, fileName: fileName, errorDescription: errorDescription))"
      }
    }
  }
  
  static var errorHeader: String {
    return "❌  ERROR  ❌\n"
  }
  
  static func errorLocation(methodName: String, fileName: String, errorDescription: String) -> String {
    var errorLocationMessage = "\nError occured in \nMethod Name: \(methodName)\nFile Name: \(fileName)"
    if !errorDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
      errorLocationMessage.append("\n⭕️ Custom Error Description: \(errorDescription)")
    }
    return errorLocationMessage
  }
}

