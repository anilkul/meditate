//
//  ListViewHorizontalCell.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewHorizontalCell: ListViewBaseCell {
  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - UI Lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.delegate = self
    configureCell()
  }
  
  func configureCell() {
    configurationBlock = { [weak self] viewModel in
      guard let self = self else { return }
      guard let viewModel = viewModel as? ListViewHorizontalCellViewModelProtocol else { return }
      self.registerCells(for: viewModel.horizontalItemType)
      self.collectionView.dataSource = viewModel.dataSource
    }
  }
  
  func registerCells(for horizontalItemTypes: HorizontalItemTypeProtocol) {
    horizontalItemTypes.horizontalCellsToRegister.forEach { (horizontalItemType) in
      collectionView.register(UINib(nibName: horizontalItemType.identifier, bundle: nil), forCellWithReuseIdentifier: horizontalItemType.identifier)
    }
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ListViewHorizontalCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    guard let cellViewModel = viewModel as? ListViewHorizontalCellViewModelProtocol else { return CGSize.zero }
    return cellViewModel.horizontalItemType.itemSize
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    switch sizeClass {
    case (.compact, .regular):
      return Constants.Interface.compactHorizontalMinimumLineSpacing
    case (.regular, .regular):
      return Constants.Interface.regularHorizontalMinimumLineSpacing
    default:
      return Constants.Interface.compactHorizontalMinimumLineSpacing
    }
  }
}
