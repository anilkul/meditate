//
//  ListViewBaseCell.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewBaseCell: UICollectionViewCell {
  // MARK: - Variables
  var viewModel: BaseCollectionViewCellViewModelProtocol!
  var configurationBlock: ((BaseCollectionViewCellViewModelProtocol) throws -> Void)?
  
  // MARK: - UI Configuration
  final func configureCell(with viewModel: BaseCollectionViewCellViewModelProtocol, for indexPath: IndexPath) {
    self.viewModel = viewModel
    
    do {
      try self.configurationBlock?(viewModel)
    } catch {
      fatalError(ErrorLogger.UIError.cellConfigureError(viewModelName: String(describing: viewModel)).errorMessage(methodName: "\(#function)", fileName: "\(#file)", errorDescription: error.localizedDescription))
    }
  }
}
