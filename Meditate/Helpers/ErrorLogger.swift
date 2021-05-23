//
//  ErrorLogger.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

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
