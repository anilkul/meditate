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
      fatalError(ErrorLogger.UIError.cellCouldNotBeCreated(className: String(describing: ListViewBaseCell.self)).errorMessage(methodName: "\(#function)", fileName: "\(#file)"))
    }
    cell.configureCell(with: cellViewModel, for: indexPath)
    if let cell = cell as? ListViewHorizontalCell {
      cell.collectionView.reloadData()
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard kind == UICollectionView.elementKindSectionHeader,
          let sectionType = SectionType(rawValue: indexPath.section),
          let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: ListViewSectionHeader.self), for: indexPath) as? ListViewSectionHeader else {
      return UICollectionReusableView()
    }
        
    sectionHeader.sectionHeaderLabel.text = sectionType.sectionTitle
    return sectionHeader
  }
}
