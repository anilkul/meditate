//
//  ListViewBannerCellViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

class ListViewBannerCellViewModel: BaseCollectionViewCellViewModel, ListViewBannerCellViewModelProtocol {
  // MARK: - Initializer
  override init() {
    super.init()
    self.type = .banner
  }
}
