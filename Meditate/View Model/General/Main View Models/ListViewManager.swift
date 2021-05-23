//
//  ListViewManager.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewManager: ListViewManagable {
  // MARK: - Variables
  var viewModel: ListViewModelProtocol
  
  lazy var dataSourceViewModel: ListViewSectionListable = {
    return ListViewDataSourceViewModel(viewModel: viewModel)
  }()
  
  lazy var dataSource: UICollectionViewDataSource = {
    return ListViewDataSource(viewModel: dataSourceViewModel)
  }()
  
  // MARK: - Initializer
  init(viewModel: ListViewModelProtocol) {
    self.viewModel = viewModel
  }
}
