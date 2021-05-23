//
//  ContentListable.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

protocol ContentListable: ContentDetailable {
  var category: String { get }
}
