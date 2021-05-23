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
