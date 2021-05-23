//
//  BaseCollectionViewCellViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

class BaseCollectionViewCellViewModel: BaseCollectionViewCellViewModelProtocol {
  var type: ItemType
  
  init() {
    type = ItemType.content
  }
}
