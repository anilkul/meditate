//
//  ViewControllers.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

struct ViewControllers {
  static func detailViewController(with content: ContentDetailable) -> DetailViewController {
    let detailViewModel = DetailViewModel(content: content)
    let storyboard = UIStoryboard(name: Constants.Interface.mainStoryboardIdentifier, bundle: nil)
    let identifier = String(describing: DetailViewController.self)
    guard let detailViewController = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else {
      fatalError(ErrorLogger.UIError.couldNotDefineController(identifier: identifier).errorMessage(methodName: "\(#function)", fileName: "\(#file)"))
    }
    detailViewController.viewModel = detailViewModel
    return detailViewController
  }
}
