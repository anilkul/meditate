//
//  ListViewParsable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

protocol ListViewParsable {
  func parsed(contentList: ContentList) -> [[BaseCollectionViewCellViewModelProtocol]]
}
