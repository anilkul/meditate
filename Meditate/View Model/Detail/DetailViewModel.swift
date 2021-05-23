//
//  DetailViewModel.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol {
  // MARK: - Variables
  var content: ContentDetailable
  var backgroundImageURL: URL?
  var formattedDateString: String
  
  // MARK: - Initialization
  init(content: ContentDetailable) {
    self.content = content
    backgroundImageURL = URL(string: content.image.large)
    formattedDateString = Constants.emptyString
    formatDateString(from: content.date)
  }
  
  // MARK: - Business Logic
  final func formatDateString(from unixTimeString: String) {
    let formatter = DateFormatter()
    let date = Date(timeIntervalSince1970: Double(unixTimeString) ?? NSTimeIntervalSince1970)
    formatter.dateFormat = Constants.dateFormatString
    formattedDateString = formatter.string(from: date)
  }
}
