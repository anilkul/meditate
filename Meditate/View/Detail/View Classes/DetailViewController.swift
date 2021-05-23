//
//  DetailViewController.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var backgrounImageView: UIImageView!
  
  // MARK: - Variables
  var viewModel: DetailViewModelProtocol!
  
  // MARK: - UI Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = viewModel.content.name
    bodyLabel.text = viewModel.content.text
    dateLabel.text = viewModel.formattedDateString
    backgrounImageView.kf.setImage(with: viewModel.backgroundImageURL)
  }
}
