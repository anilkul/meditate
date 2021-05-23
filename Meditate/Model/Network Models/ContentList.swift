//
//  ContentList.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

// MARK: - ContentList
struct ContentList: Decodable {
  let isBannerEnabled: Bool
  let meditations: [Meditation]
  let stories: [Story]
}

// MARK: - Meditation
struct Meditation: ContentListable {
  let name, category: String
  let image: Image
  let date, text: String
  
  enum CodingKeys: String, CodingKey {
    case name = "title"
    case category = "releaseDate"
    case date = "subtitle"
    case text = "content"
    case image
  }
}

// MARK: - Image
struct Image: Decodable {
  let small, large: String
}

// MARK: - Story
struct Story: ContentListable {
  let name, category: String
  let image: Image
  let date, text: String
}
