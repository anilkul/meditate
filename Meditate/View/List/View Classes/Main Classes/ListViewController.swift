//
//  ListViewController.swift
//  Meditate
//
//  Created by Mehmet Anıl Kul on 23.05.2021.
//

import UIKit

class ListViewController: BaseViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - Variables
  private var manager: ListViewManagable!
  
  // MARK: - UI Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    manager = ListViewManager(viewModel: ListViewModel())
    provideBindings()
    configureUI()
    
    manager.dataProvider.requestContentList()
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  // MARK: - Bindings
  private final func provideBindings() {
    manager.viewModel.reloadTrigger = reloadData()
    manager.router.pushViewController = pushViewController()
  }
  
  // MARK: - UI Operations
  private final func configureUI() {
    collectionView.contentInset = manager.viewModel.collectionViewEdgeInsets
    navigationItem.backBarButtonItem = UIBarButtonItem(title: Constants.emptyString,
                                                       style: .plain,
                                                       target: nil,
                                                       action: nil)
    collectionView.dataSource = manager.dataSource
    registerComponents()
  }
  
  private final func registerComponents() {
    ItemType.mainCellsToRegister.forEach { (cellType) in
      collectionView.register(UINib(nibName: cellType.identifier, bundle: nil), forCellWithReuseIdentifier: cellType.identifier)
    }
    collectionView.register(UINib.init(nibName: String(describing: ListViewSectionHeader.self), bundle: nil),
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: String(describing: ListViewSectionHeader.self))
  }

  final func reloadData() -> VoidHandler {
    return { [weak self] in
      guard let self = self else { return }
      self.collectionView.reloadData()
    }
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    self.collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellViewModel = manager.dataSourceViewModel.cellViewModel(at: indexPath)
    return cellViewModel.type.itemSize
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    guard let sectionType = SectionType(rawValue: section) else {
      return UIEdgeInsets(top: 0,
                          left: Constants.Interface.collectionViewCompactLeftInset,
                          bottom: 0,
                          right: Constants.Interface.collectionViewCompactRightInset)
    }
    return sectionType.edgeInsets
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    guard let sectionType = SectionType(rawValue: section) else {
      return Constants.Interface.compactMinimumLineSpacing
    }
    return sectionType.minimumLineSpacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    guard let sectionType = SectionType(rawValue: section) else {
      return Constants.Interface.compactMinimumInteritemSpacing
    }
    return sectionType.minimumInteritemSpacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    guard let sectionType = SectionType(rawValue: section) else {
      return CGSize.zero
    }
    return sectionType.sectionHeaderSize
  }
}
