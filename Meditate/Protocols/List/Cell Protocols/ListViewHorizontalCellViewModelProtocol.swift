//
//  ListViewHorizontalCellViewModelProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

protocol ListViewHorizontalCellViewModelProtocol: BaseCollectionViewCellViewModelProtocol {
  var dataSource: UICollectionViewDataSource { get }
  var horizontalItemType: ItemType { get }
}
