//
//  Global Variables.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

/// The indicator that if shows device is an iPad
var isIpad: Bool {
  return UIDevice.current.userInterfaceIdiom == .pad
}

/// Sizeclass of current window. If somehow window is not avaiable, returns screen sizeclasses
/// Since the app uses multitasking, windows size is preferred over screen size
var sizeClass: (UIUserInterfaceSizeClass, UIUserInterfaceSizeClass) {
  let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
  return (window?.traitCollection.horizontalSizeClass ?? UIScreen.main.traitCollection.horizontalSizeClass,
          window?.traitCollection.verticalSizeClass ?? UIScreen.main.traitCollection.verticalSizeClass)
}

/// Global variable that indicates if is in landscape mode
var isLandscape: Bool {
  if #available(iOS 13.0, *) {
    guard let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation else {
      #if DEBUG
      fatalError(ErrorLogger.UIError.couldNotObtainOrientation.errorMessage(methodName: "\(#function)", fileName: "\(#file)"))
      #else
      return false
      #endif
    }
    return orientation.isLandscape && isIpad
  } else {
    return UIApplication.shared.statusBarOrientation.isLandscape && isIpad
  }
}
