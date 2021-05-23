//
//  ListViewModelProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

protocol ListViewModelProtocol: ListViewModelDataProcessable {
  var collectionViewEdgeInsets: UIEdgeInsets { get }
}
