//
//  DetailViewModelProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

protocol DetailViewModelProtocol {
  var content: ContentDetailable { get }
  var backgroundImageURL: URL? { get }
  var formattedDateString: String { get }
}
