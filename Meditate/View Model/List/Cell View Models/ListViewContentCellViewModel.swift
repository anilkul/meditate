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
  var content: ContentListable
  var router: Routable
  
  // MARK: - Initializer
  init(itemType: ItemType, content: ContentListable, router: Routable) {
    self.router = router
    self.content = content
    imageURL = URL(string: content.image.small)
    super.init()
    type = itemType
  }
}
