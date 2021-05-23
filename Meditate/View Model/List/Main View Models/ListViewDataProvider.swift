//
//  ListViewDataProvider.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

class ListViewDataProvider: ListViewDataProvidable {
  // MARK: - Variables
  var viewModel: ListViewModelProtocol
  var parser: ListViewParsable
  var networkManager: NetworkManagable
  
  // MARK: - InternetConnection
  init(viewModel: ListViewModelProtocol, parser: ListViewParsable, networkManager: NetworkManagable) {
    self.viewModel = viewModel
    self.parser = parser
    self.networkManager = networkManager
  }
  
  // MARK: -
  func requestContentList() {
    // Since baseURL is provided as default value and other default values satisfy our network request, no need to fill the APIMethod struct.
    let apiMethod: APIMethod = APIMethod()
    networkManager.request(apiMethod) { (result: APIResult<ContentList>) in
      switch result {
      case .success(let contentList):
        self.viewModel.cellViewModels = self.parser.parsed(contentList: contentList)
        self.viewModel.reloadTrigger?()
      case .failure(let error):
        // TODO: Error Logger
        print(error)
      }
    }
  }
}
