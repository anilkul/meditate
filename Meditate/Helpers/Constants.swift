//
//  Constants.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

typealias VoidHandler = () -> Void

struct Constants {
  static let emptyString: String = ""
  static let bannerIndex: Int = 1
  static let dateFormatString: String = "MM/dd/yyyy, EE"
  
  // URLs
  struct URLs {
    static let baseURL = "https://jsonblob.com/api/jsonBlob/a07152f5-775c-11eb-a533-c90b9d55001f"
  }
  
  // UI
  struct Interface {
    static var windowWidth: CGFloat {
      UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.frame.width ?? UIScreen.main.bounds.width
    }
    
    static let mainStoryboardIdentifier: String = "Main"
    
    // List
    static let collectionViewCompactTopInset: CGFloat = 28
    static let collectionViewRegularTopInset: CGFloat = 48
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
    
    /// Section Type
    static let compactSectionBottomMargin: CGFloat = 40
    static let regularSectionBottomMargin: CGFloat = 48
    static let meditationsTitle: String = "Mediations"
    static let storiesTitle: String = "Stories"
    static let compactSectionHeaderHeight: CGFloat = 45
    static let regularSectionHeaderHeight: CGFloat = 58
    static let compactMinimumLineSpacing: CGFloat = 32
    static let regularMinimumLineSpacing: CGFloat = 40
    static let compactMinimumInteritemSpacing: CGFloat = 16
    static let regularMinimumInteritemSpacing: CGFloat = 24
    static let compactHorizontalMinimumLineSpacing: CGFloat = 16
    static let regularHorizontalMinimumLineSpacing: CGFloat = 24
  }
}
