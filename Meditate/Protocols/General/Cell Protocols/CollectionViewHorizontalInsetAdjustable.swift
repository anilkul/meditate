//
//  CollectionViewHorizontalInsetAdjustable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

/// A protocol that determines collection view insets
protocol CollectionViewHorizontalInsetAdjustable {
  var collectionViewHorizontalInset: (left: CGFloat, right: CGFloat) { get }
}

extension CollectionViewHorizontalInsetAdjustable {
  var collectionViewHorizontalInset: (left: CGFloat, right: CGFloat) {
    switch sizeClass {
    case (.compact, .regular):
      return (Constants.Interface.collectionViewCompactLeftInset, Constants.Interface.collectionViewCompactRightInset)
    case (.regular, .regular):
      return (Constants.Interface.collectionViewRegularLeftInset, Constants.Interface.collectionViewRegularRightInset)
    default:
      return (Constants.Interface.collectionViewCompactLeftInset, Constants.Interface.collectionViewCompactRightInset)
    }
  }
}
