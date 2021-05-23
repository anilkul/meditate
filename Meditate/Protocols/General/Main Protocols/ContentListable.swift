//
//  ContentListable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

protocol ContentListable: Decodable {
  var name: String { get }
  var category: String { get }
  var image: Image { get }
  var date: String { get }
  var text: String { get }
}
