//
//  ListViewContentCell.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewContentCell: ListViewBaseCell {
  // MARK: - IBOutlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  // MARK: - UI Lifecycle
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  // MARK: - Configuration
  
}
