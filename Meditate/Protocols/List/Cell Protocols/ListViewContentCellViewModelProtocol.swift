//
//  ListViewContentCellViewModelProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

protocol ListViewContentCellViewModelProtocol: BaseCollectionViewCellViewModelProtocol {
  var imageURL: URL? { get }
  var name: String { get }
  var category: String { get }
  var imageHeight: CGFloat { get }
  var imageWidth: CGFloat { get }
}
