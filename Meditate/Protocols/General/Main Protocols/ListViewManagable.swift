//
//  ListViewManagable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

protocol ListViewManagable {
  var viewModel: ListViewModelProtocol { get set }
  var dataSourceViewModel: ListViewSectionListable { get }
  var dataSource: UICollectionViewDataSource { get }
  var networkManager: NetworkManagable { get }
  var dataProvider: ListViewDataProvidable { get }
  var parser: ListViewParsable { get }
}
