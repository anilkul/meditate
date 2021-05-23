//
//  GradientView.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

@IBDesignable class GradientView: UIView {
  @IBInspectable var topColor: UIColor = UIColor.white
  @IBInspectable var bottomColor: UIColor = UIColor.black
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  override func layoutSubviews() {
    guard let layer = layer as? CAGradientLayer else { return }
    layer.colors = [topColor.cgColor, bottomColor.cgColor]
  }
}
