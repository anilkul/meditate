//
//  HorizontalItemTypeProtocol.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

/// A protocol that determines what horizontal cells use
protocol HorizontalItemTypeProtocol {
  var horizontalCellsToRegister: [ItemType] { get }
}
