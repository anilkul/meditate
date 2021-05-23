//
//  ListViewDataSourceViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewDataSourceViewModel: ListViewSectionListable {
  // MARK: - Variables
  private let viewModel: ListViewModelProtocol
  
  var numberOfSections: Int {
    viewModel.cellViewModels.count
  }
  
  // MARK: - Initializer
  init(viewModel: ListViewModelProtocol) {
    self.viewModel = viewModel
  }
  
  // MARK: - Data Source Logic
  final func numberOfItems(in section: Int) -> Int {
    viewModel.cellViewModels[section].count
  }
  
  final func cellViewModel(at indexPath: IndexPath) -> BaseCollectionViewCellViewModelProtocol {
    viewModel.cellViewModels[indexPath.section][indexPath.row]
  }
}
