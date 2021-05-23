//
//  ListViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

class ListViewModel: ListViewModelProtocol {
  // MARK: - Variables
  var cellViewModels: [[BaseCollectionViewCellViewModelProtocol]]
  var reloadTrigger: VoidHandler?
  
  // MARK: - Initializer
  init() {
    cellViewModels = []
  }
}
