//
//  BaseCollectionViewCellViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

class BaseCollectionViewCellViewModel: BaseCollectionViewCellViewModelProtocol {
  // MARK: - Variables
  var type: ItemType
  
  // MARK: - Initializer
  init() {
    type = ItemType.content
  }
}
