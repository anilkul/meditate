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
  var imageHeight: CGFloat
  var imageWidth: CGFloat
  
  // MARK: - Initializer
  init(itemType: ItemType, content: ContentListable) {
    self.name = content.name
    self.category = content.category
    self.imageHeight = itemType.imageHeight
    self.imageWidth = itemType.itemWidth
    imageURL = URL(string: content.image.small)
    super.init()
    self.type = itemType
  }
}
