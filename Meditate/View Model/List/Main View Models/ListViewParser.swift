//
//  ListViewParser.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

class ListViewParser: ListViewParsable {
  // MARK: - Variables
  var router: Routable
  
  // MARK: - Initializer
  init(router: Routable) {
    self.router = router
  }
  
  // MARK: - List Parser
  final func parsed(contentList: ContentList) -> [[BaseCollectionViewCellViewModelProtocol]] {
    var dataSource: [[BaseCollectionViewCellViewModelProtocol]] = []
    let horizontalList = [ListViewHorizontalCellViewModel(cellViewModels: parsed(content: contentList.meditations, itemType: .horizontal(.content)), horizontalItemType: .content)]
    dataSource.append(horizontalList)
    dataSource.append(parsed(content: contentList.stories, itemType: .content))
    
    addBannerIfNeeded(to: &dataSource, isBannerEnabled: contentList.isBannerEnabled)
    return dataSource
  }
  
  private final func addBannerIfNeeded(to dataSource: inout [[BaseCollectionViewCellViewModelProtocol]], isBannerEnabled: Bool) {
    guard isBannerEnabled else { return }
    dataSource.insert([ListViewBannerCellViewModel()], at: Constants.bannerIndex)
  }
  
  // MARK: - Content Parser
  private final func parsed(content: [ContentListable], itemType: ItemType) -> [BaseCollectionViewCellViewModelProtocol] {
    var contentDataSource: [BaseCollectionViewCellViewModelProtocol] = []
    content.forEach {
      contentDataSource.append(ListViewContentCellViewModel(itemType: itemType, content: $0, router: router))
    }
    
    return contentDataSource
  }
}
