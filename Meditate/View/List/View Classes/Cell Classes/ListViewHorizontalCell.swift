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
  }
  
}

extension ListViewHorizontalCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    guard let cellViewModel = viewModel as? ListViewHorizontalCellViewModelProtocol else { return CGSize.zero }
    return cellViewModel.horizontalItemType.itemSize
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    switch sizeClass {
    case (.compact, .regular):
      return 16
    case (.regular, .regular):
      return 24
    default:
      return 16
    }
  }
}
