//
//  ListViewModelDataProcessable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 24.05.2021.
//

protocol ListViewModelDataProcessable {
  var cellViewModels: [[BaseCollectionViewCellViewModelProtocol]] { get set }
  var reloadTrigger: VoidHandler? { get set }
}
