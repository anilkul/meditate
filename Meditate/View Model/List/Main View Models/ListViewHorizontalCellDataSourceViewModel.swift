//
//  ListViewHorizontalCellDataSourceViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

class ListViewHorizontalCellDataSourceViewModel: ListViewListable {
  // MARK: - Variables
  private let cellViewModels: [BaseCollectionViewCellViewModelProtocol]
  
  // MARK: - Initializer
  init(cellViewModels: [BaseCollectionViewCellViewModelProtocol]) {
    self.cellViewModels = cellViewModels
  }
  
  // MARK: - Data Source Logic
  final func numberOfItems(in section: Int) -> Int {
    return cellViewModels.count
  }
  
  final func cellViewModel(at indexPath: IndexPath) -> BaseCollectionViewCellViewModelProtocol {
    return cellViewModels[indexPath.row]
  }
}
