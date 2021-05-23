//
//  ListViewContentCellViewModelProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

protocol ListViewContentCellViewModelProtocol: BaseCollectionViewCellViewModelProtocol {
  var imageURL: URL? { get }
  var content: ContentListable { get }
  var router: Routable { get }
}
