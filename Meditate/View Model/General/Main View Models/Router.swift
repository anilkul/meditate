//
//  Router.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

protocol Routable {
  var pushViewController: ((UIViewController) -> Void)? { get set }
}

struct Router: Routable {
  var pushViewController: ((UIViewController) -> Void)?
}
