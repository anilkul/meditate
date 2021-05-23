//
//  ListViewHorizontalCellViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewHorizontalCellViewModel: BaseCollectionViewCellViewModel, ListViewHorizontalCellViewModelProtocol {
  // MARK: - Variables
  var horizontalItemType: ItemType
  private let cellViewModels: [BaseCollectionViewCellViewModelProtocol]
  
  lazy var dataSourceViewModel: ListViewListable = {
    return ListViewHorizontalCellDataSourceViewModel(cellViewModels: cellViewModels)
  }()
  
  lazy var dataSource: UICollectionViewDataSource = {
    return ListViewHorizontalCellDataSource(viewModel: dataSourceViewModel)
  }()
  
  // MARK: - Initializer
  init(cellViewModels: [BaseCollectionViewCellViewModelProtocol], horizontalItemType: ItemType) {
    self.cellViewModels = cellViewModels
    self.horizontalItemType = ItemType.horizontal(horizontalItemType)
    super.init()
    type = ItemType.horizontal(nil)
  }
}
