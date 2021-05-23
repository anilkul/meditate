//
//  ListViewDataSource.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewDataSource: NSObject, UICollectionViewDataSource {
  // MARK: - Variables
  var viewModel: ListViewSectionListable
  
  // MARK: - Initializer
  init(viewModel: ListViewSectionListable) {
    self.viewModel = viewModel
  }
  
  // MARK: - Data Source Methods
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    viewModel.numberOfSections
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.numberOfItems(in: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cellViewModel = viewModel.cellViewModel(at: indexPath)
    let identifier = cellViewModel.type.identifier
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ListViewBaseCell else {
      fatalError("Cell could not be created.")
    }
    cell.configureCell(with: cellViewModel, for: indexPath)
    if let cell = cell as? ListViewHorizontalCell {
      cell.collectionView.reloadData()
    }
    return cell
  }
}
