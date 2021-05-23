//
//  SectionType.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

enum SectionType: Int, CollectionViewHorizontalInsetAdjustable {
  case meditations, banner, stories
  
  private typealias IndividualConstants = Constants.Interface
  
  /// A variable that returns edge insets for the sections with respect to current size classes.
  var edgeInsets: UIEdgeInsets {
    switch self {
    case .meditations:
      return UIEdgeInsets(top: 0,
                          left: collectionViewHorizontalInset.left,
                          bottom: sectionBottomMargin,
                          right: 0)
    case .banner, .stories:
      return UIEdgeInsets(top: 0,
                          left: collectionViewHorizontalInset.left,
                          bottom: sectionBottomMargin,
                          right: collectionViewHorizontalInset.right)
    }
  }
  
  var sectionTitle: String {
    switch self {
    case .meditations:
      return IndividualConstants.meditationsTitle
    case .stories:
      return IndividualConstants.storiesTitle
    default:
      return Constants.emptyString
    }
  }
  
  var sectionHeaderSize: CGSize {
    guard hasHeader else { return CGSize.zero }
    let width = Constants.Interface.windowWidth
      - collectionViewHorizontalInset.left
      - collectionViewHorizontalInset.right
    
    switch sizeClass {
    case (.compact, .regular):
      return CGSize(width: width,
                    height: IndividualConstants.compactSectionHeaderHeight)
    case (.regular, .regular):
      return CGSize(width: width,
                    height: IndividualConstants.regularSectionHeaderHeight)
    default:
      return CGSize(width: width,
                    height: IndividualConstants.compactSectionHeaderHeight)
    }
  }
  
  var minimumLineSpacing: CGFloat {
    switch sizeClass {
    case (.compact, .regular):
      return IndividualConstants.compactMinimumLineSpacing
    case (.regular, .regular):
      return IndividualConstants.regularMinimumLineSpacing
    default:
      return IndividualConstants.compactMinimumLineSpacing
    }
  }
  
  var minimumInteritemSpacing: CGFloat {
    switch sizeClass {
    case (.compact, .regular):
      return IndividualConstants.compactMinimumInteritemSpacing
    case (.regular, .regular):
      return IndividualConstants.regularMinimumInteritemSpacing
    default:
      return IndividualConstants.compactMinimumInteritemSpacing
    }
  }
  
  private var sectionBottomMargin: CGFloat {
    switch sizeClass {
    case (.compact, .regular):
      return IndividualConstants.compactSectionBottomMargin
    case (.regular, .regular):
      return IndividualConstants.regularSectionBottomMargin
    default:
      return IndividualConstants.compactSectionBottomMargin
    }
  }
  
  private var hasHeader: Bool {
    switch self {
    case .banner:
      return false
    default:
      return true
    }
  }
}
