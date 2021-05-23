//
//  ContentDetailProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import Foundation

protocol ContentDetailable: Decodable {
  var name: String { get }
  var date: String { get }
  var text: String { get }
  var image: Image { get }
}
