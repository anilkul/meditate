//
//  ListViewBannerCell.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewBannerCell: ListViewBaseCell {
  // MARK: - IBOutlets
  @IBOutlet weak var bannerLabel: UILabel!
  
  // MARK: - UI Lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()
    configureCell()
  }
  
  // MARK: - UI Configuration
  final func configureCell() {
    configurationBlock = { [weak self] _ in
      guard let self = self else { return }
      self.configureTextAlignment()
    }
  }
  
  final func configureTextAlignment() {
    switch sizeClass {
    case (.compact, .regular):
      return bannerLabel.textAlignment = .left
    case (.regular, .regular):
      return bannerLabel.textAlignment = .center
    default:
      return bannerLabel.textAlignment = .left
    }
  }
}
