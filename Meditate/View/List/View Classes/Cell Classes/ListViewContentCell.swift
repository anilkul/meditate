//
//  ListViewContentCell.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit
import Kingfisher

class ListViewContentCell: ListViewBaseCell {
  // MARK: - IBOutlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  // MARK: - UI Lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()
    configureCell()
  }
  
  // MARK: - Configuration
  func configureCell() {
    configurationBlock = { [weak self] viewModel in
      guard let self = self else { return }
      guard let viewModel = viewModel as? ListViewContentCellViewModelProtocol else { return }
      self.imageView.kf.setImage(with: viewModel.imageURL)
      self.titleLabel.text = viewModel.content.name
      self.subtitleLabel.text = viewModel.content.category
    }
  }
  
  @IBAction func contentPressed(_ sender: UIButton) {
    guard let viewModel = viewModel as? ListViewContentCellViewModelProtocol else { return }
    let detailViewController = ViewControllers.detailViewController(with: viewModel.content)
    viewModel.router.pushViewController?(detailViewController)
  }
}
