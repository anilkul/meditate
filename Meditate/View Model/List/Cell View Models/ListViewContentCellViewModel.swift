//
//  ListViewContentCellViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewContentCellViewModel: BaseCollectionViewCellViewModel, ListViewContentCellViewModelProtocol {
  // MARK: - Variables
  var imageURL: URL?
  var name: String
  var category: String
  
  // MARK: - Initializer
  init(itemType: ItemType, content: ContentListable) {
    self.name = content.name
    self.category = content.category
    imageURL = URL(string: content.image.small)
    super.init()
    self.type = itemType
  }
}
