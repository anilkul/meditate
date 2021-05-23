//
//  ListViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewModel: ListViewModelProtocol {
  // MARK: - Variables
  var cellViewModels: [[BaseCollectionViewCellViewModelProtocol]]
  var reloadTrigger: VoidHandler?
  
  // MARK: - Initializer
  init() {
    cellViewModels = []
  }
  
  var collectionViewEdgeInsets: UIEdgeInsets {
    switch sizeClass {
    case (.compact, .regular):
      return UIEdgeInsets(top: Constants.Interface.collectionViewCompactTopInset, left: 0, bottom: 0, right: 0)
    case (.regular, .regular):
      return UIEdgeInsets(top: Constants.Interface.collectionViewRegularTopInset, left: 0, bottom: 0, right: 0)
    default:
      return UIEdgeInsets(top: Constants.Interface.collectionViewCompactTopInset, left: 0, bottom: 0, right: 0)
    }
  }
}
