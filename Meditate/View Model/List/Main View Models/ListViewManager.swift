//
//  ListViewManager.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

// A general view model which includes all layers of business logic
class ListViewManager: ListViewManagable {
  // MARK: - View Model
  var viewModel: ListViewModelProtocol
  
  // MARK: - Data Source View Model
  lazy var dataSourceViewModel: ListViewSectionListable = {
    return ListViewDataSourceViewModel(viewModel: viewModel)
  }()
  
  // MARK: - Data Source
  lazy var dataSource: UICollectionViewDataSource = {
    return ListViewDataSource(viewModel: dataSourceViewModel)
  }()
  
  // MARK: - Network Manager
  lazy var networkManager: NetworkManagable = {
    return NetworkManager()
  }()
  
  // MARK: - Parser
  lazy var parser: ListViewParsable = {
    return ListViewParser(router: router)
  }()
  
  // MARK: - Data Provider
  lazy var dataProvider: ListViewDataProvidable = {
    return ListViewDataProvider(viewModel: viewModel, parser: parser, networkManager: networkManager)
  }()
  
  // MARK: - Router
  lazy var router: Routable = {
    return Router()
  }()
  
  // MARK: - Initializer
  init(viewModel: ListViewModelProtocol) {
    self.viewModel = viewModel
  }
}
