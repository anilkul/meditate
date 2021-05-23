//
//  ListViewSectionListable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

protocol ListViewSectionListable: ListViewListable {
  var numberOfSections: Int { get }
}
