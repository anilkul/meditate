//
//  Constants.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

struct Constants {
  // URLs
  struct URLs {
    static let baseURL = "https://jsonblob.com/api/jsonBlob/a07152f5-775c-11eb-a533-c90b9d55001f"
  }
  
  // UI
  struct Interface {
    static var windowWidth: CGFloat {
      UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.frame.width ?? UIScreen.main.bounds.width
    }
    
    // List
    static let contentTitleTopMargin: CGFloat = 8
    static let bannerHeight: CGFloat = 124
    static let compactAspectRatio: CGFloat = 1.405
    static let regularAspectRatio: CGFloat = 1.336
    static let compactTitleHeight: CGFloat = 27
    static let regularTitleHeight: CGFloat = 28
    static let compactSubtitleHeight: CGFloat = 24
    static let regularSubtitleHeight: CGFloat = 25
    static let compactColumnSize: CGFloat = 2
    static let regularColumnSize: CGFloat = isLandscape ? 6 : 4
    static let compactCellSpacing: CGFloat = 16
    static let regularCellSpacing: CGFloat = 24
    static let collectionViewCompactLeftInset: CGFloat = 24
    static let collectionViewCompactRightInset: CGFloat = 24
    static let collectionViewRegularLeftInset: CGFloat = 40
    static let collectionViewRegularRightInset: CGFloat = 40
  }
}
