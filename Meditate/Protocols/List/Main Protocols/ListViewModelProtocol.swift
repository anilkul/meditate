//
//  ListViewModelProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

protocol ListViewModelProtocol {
  var cellViewModels: [[BaseCollectionViewCellViewModelProtocol]] { get set }
  var reloadTrigger: VoidHandler? { get set }
}
