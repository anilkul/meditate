//
//  ItemType.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

/// A type that describes items in the main list.
///
/// Since there are horizontal lists inside the main list, the indirect `.horizontal(ItemType?)` case lets us using any type of item type in the main vertical list inside the inner horizontal list with easy configuration.
enum ItemType: Equatable, HorizontalItemTypeProtocol, CollectionViewHorizontalInsetAdjustable {
  indirect case horizontal(ItemType?)
  case banner, content
  
  private typealias IndividualConstants = Constants.Interface
  
  /// List of cells to register to main list
  static var mainCellsToRegister: [ItemType] {
    return [.horizontal(nil), .content, .banner]
  }
  
  /// A computed variable that calculates item size according to indents, column size and spacing
  var itemSize: CGSize {
    switch self {
    case .horizontal(let itemType):
      let height = floor((itemType == nil ? ItemType.content.itemWidth : itemWidth) * aspectRatio) + lineHeight.subtitle + lineHeight.title + IndividualConstants.contentTitleTopMargin
      if itemType == nil {
        return CGSize(width: Constants.Interface.windowWidth - collectionViewHorizontalInset.left, height: height)
      }
      return CGSize(width: itemWidth, height: height)
    case .content:
      let height = itemWidth
        + lineHeight.subtitle
        + lineHeight.title
        + IndividualConstants.contentTitleTopMargin
      return CGSize(width: itemWidth, height: height)
    case .banner:
      return CGSize(width: itemWidth, height: IndividualConstants.bannerHeight)
    }
  }
  
  /// List of cells to register for horizontal collection views in the list
  var horizontalCellsToRegister: [ItemType] {
    return [.content]
  }
  
  /// Aspect ratio for non-square images in the meditations section.
  /// Ratios calculated with respect to the design on Figma
  private var aspectRatio: CGFloat {
    switch sizeClass {
    case (.compact, .regular):
      return IndividualConstants.compactAspectRatio
    case (.regular, .regular):
      return IndividualConstants.regularAspectRatio
    default:
      return IndividualConstants.compactAspectRatio
    }
  }
  
  /// A tuple that returns line heights to determine item height
  /// Since cells in the stories and the meditation sections are the same, I'd wanted to add this kind of logic. This must be edited as well if title and subtitle label height constraints are edited on IB.
  private var lineHeight: (title: CGFloat, subtitle: CGFloat) {
    switch sizeClass {
    case (.compact, .regular):
      return (IndividualConstants.compactTitleHeight, IndividualConstants.compactSubtitleHeight)
    case (.regular, .regular):
      return (IndividualConstants.regularTitleHeight, IndividualConstants.regularSubtitleHeight)
    default:
      return (IndividualConstants.compactTitleHeight, IndividualConstants.compactSubtitleHeight)
    }
  }
  
  /// This variable stands for column size for different traits
  /// In order to not to cast from Int to CGFloat when used, this one is CGFloat
  private var columnSizeInSection: CGFloat {
    if self == .banner || self == .horizontal(nil) {
      return 1
    }
    switch sizeClass {
    case (.compact, .regular):
      return IndividualConstants.compactColumnSize
    case (.regular, .regular):
      return IndividualConstants.regularColumnSize
    default:
      return IndividualConstants.compactColumnSize
    }
  }
  
  /// Calculated height of the image in content cells
  var imageHeight: CGFloat {
    let isHorizontal = self == .horizontal(nil) || self == .horizontal(.content)
    return isHorizontal ? floor(itemWidth * aspectRatio) : itemWidth
  }
  
  /// Calculated item width for cells
  var itemWidth: CGFloat {
    return floor((Constants.Interface.windowWidth - ((columnSizeInSection - 1) * cellSpacing) - (collectionViewHorizontalInset.left + collectionViewHorizontalInset.right)) / columnSizeInSection)
  }
  
  /// A Variable that returns spacing between cells for different traits.
  private var cellSpacing: CGFloat {
    switch sizeClass {
    case (.compact, .regular):
      return IndividualConstants.compactCellSpacing
    case (.regular, .regular):
      return IndividualConstants.regularCellSpacing
    default:
      return IndividualConstants.compactCellSpacing
    }
  }
}
