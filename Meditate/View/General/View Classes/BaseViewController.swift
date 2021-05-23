//
//  BaseViewController.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class BaseViewController: UIViewController {
  // MARK: - UI Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Routing
  final func pushViewController() -> (_ viewController: UIViewController) -> Void {
    return { [weak self] viewController in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
}
