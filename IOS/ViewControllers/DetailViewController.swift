import UIKit

class DetailViewController: BaseViewController {
    struct Section: Hashable {
        let header: String
        let footer: String
        let items: [Item]
    }
    
    struct Item: Hashable {
        let label: String
        let value: String
        private let identifier = UUID()
    }
    
    let form = [
        Section(
            header: "Brightness",
            footer: "",
            items: [
                Item(label: "Auto-Lock", value: "Never"),
                Item(label: "Raise to Wake", value: "-")
            ]
        ),
        
        Section(
            header: "Display zoom",
            footer: "Choose a view for iphone. zoomed shows larger controls. Standard shows more content.",
            items: [
                Item(label: "View", value: "Standard")
            ]
        )
    ]
    
    lazy var collectionView: UICollectionView = {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        config.headerMode = .supplementary
        config.footerMode = .supplementary
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout.list(
                using: config
            )
        )
        
        collectionView.delegate = self
        return collectionView
    }()
    
    
    lazy var header = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) {
        [unowned self] (headerView, elementKind, indexPath) in
        
        let section = self.dataSource.snapshot().sectionIdentifiers[ indexPath.section ]
        var config = headerView.defaultContentConfiguration()
        
        config.text = section.header
        config.textProperties.font = .boldSystemFont(ofSize: 16)
        config.directionalLayoutMargins = .init(top: 20.0, leading: 0.0, bottom: 10.0, trailing: 0.0)
        
        headerView.contentConfiguration = config
    }
    
    lazy var footer = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) {
        [unowned self] (footerView, elementKind, indexPath) in
        
        let section = self.dataSource.snapshot().sectionIdentifiers[ indexPath.section ]
        var config = footerView.defaultContentConfiguration()
        
        config.text = section.footer
        config.textProperties.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        footerView.contentConfiguration = config
    }
    
    lazy var dataSource: UICollectionViewDiffableDataSource<Section, Item> = {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { (cell, _, item) in
            var content = UIListContentConfiguration.valueCell()
            content.text = item.label
            content.secondaryText = item.value
//            content.image = UIImage(systemName: "globe")
//            content.imageProperties.preferredSymbolConfiguration = .init(font: content.textProperties.font, scale: .large)
            
            cell.contentConfiguration = content
            cell.tintColor = .systemPurple
            cell.accessories = [ .disclosureIndicator() ]
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        dataSource.supplementaryViewProvider = { [unowned self](collectionView, elementKind, indexPath) -> UICollectionReusableView? in
            if elementKind == UICollectionView.elementKindSectionHeader {
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: self.header, for: indexPath)
            } else {
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: self.footer, for: indexPath)
            }
        }
        
        return dataSource
    }()
    
    func apply() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections( form )
        
        for section in form {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    override func layout() {
        safeView.addSubviews( collectionView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[collectionView]|": [],
                "V:|[collectionView]|": []
            ],
            [
                "collectionView": collectionView
            ],
            nil
        )
        
        apply()
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = dataSource.itemIdentifier(for: indexPath) {
            print("didSelect \(item)")
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}
