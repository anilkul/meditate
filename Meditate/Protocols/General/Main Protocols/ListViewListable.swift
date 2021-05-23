//
//  ListViewListable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

protocol ListViewListable {
  func numberOfItems(in section: Int) -> Int
  func cellViewModel(at indexPath: IndexPath) -> BaseCollectionViewCellViewModelProtocol
}
