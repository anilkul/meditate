//
//  ListViewHorizontalCellDataSource.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

// Providing number of items and cell for item can be achieved by holding a weak ListViewHorizontalCellViewModel as well. Since it'd be optional, another viewModel(ListViewHorizontalCellDataSourceViewModel) looks more elegant.
class ListViewHorizontalCellDataSource: NSObject, UICollectionViewDataSource {
  
  // MARK: - Variables
  var viewModel: ListViewListable
  
  // MARK: - Initializer
  init(viewModel: ListViewListable) {
    self.viewModel = viewModel
  }
  
  // MARK: - Data Source Methods
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfItems(in: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellViewModel = viewModel.cellViewModel(at: indexPath)
    let identifier = cellViewModel.type.identifier
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ListViewBaseCell else {
      fatalError(ErrorLogger.UIError.cellCouldNotBeCreated(className: String(describing: ListViewBaseCell.self)).errorMessage(methodName: "\(#function)", fileName: "\(#file)"))
    }
    cell.configureCell(with: cellViewModel, for: indexPath)
    return cell
  }
}
