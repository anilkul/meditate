//
//  Meditation.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 24.05.2021.
//

// MARK: - Meditation
struct Meditation: ContentListable {
  let name, category: String
  let image: Image
  let date, text: String
  
  enum CodingKeys: String, CodingKey {
    case name = "title"
    case category = "subtitle"
    case date = "releaseDate"
    case text = "content"
    case image
  }
}
