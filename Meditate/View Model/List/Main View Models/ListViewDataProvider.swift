//
//  ListViewDataProvider.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

class ListViewDataProvider: ListViewDataProvidable {
  // MARK: - Variables
  private var viewModel: ListViewModelProtocol
  private let parser: ListViewParsable
  private let networkManager: NetworkManagable
  
  // MARK: - Initialization
  init(viewModel: ListViewModelProtocol, parser: ListViewParsable, networkManager: NetworkManagable) {
    self.viewModel = viewModel
    self.parser = parser
    self.networkManager = networkManager
  }
  
  // MARK: - Request Operations
  final func requestContentList() {
    // Since baseURL is provided as default value and other default values satisfy our network request, no need to fill the APIMethod struct.
    let apiMethod: APIMethod = APIMethod()
    networkManager.request(apiMethod) { (result: APIResult<ContentList>) in
      switch result {
      case .success(let contentList):
        self.viewModel.cellViewModels = self.parser.parsed(contentList: contentList)
        self.viewModel.reloadTrigger?()
      case .failure(let error):
        #if DEBUG
        print(APIError.apiError(error: error))
        #endif
      }
    }
  }
}
