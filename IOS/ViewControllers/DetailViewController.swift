import UIKit

class DetailViewController: BaseViewController {
    enum Section: CaseIterable {
        case main
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.list(
            using: UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        )
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGroupedBackground
        return collectionView
    }()
    
    lazy var dataSource: UICollectionViewDiffableDataSource<Section, Country> = {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Country> { (cell, _, country) in
            var content = UIListContentConfiguration.valueCell()
            content.text = country.name
            content.secondaryText = country.capital
            
            content.image = UIImage(systemName: "globe")
            content.imageProperties.preferredSymbolConfiguration = .init(font: content.textProperties.font, scale: .large)
            
            cell.tintColor = .systemPurple
            cell.contentConfiguration = content
            cell.accessories = [ .disclosureIndicator() ]
        }
        
        return UICollectionViewDiffableDataSource<Section, Country>(collectionView: collectionView) { (collectionView, indexPath, country) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: country)
        }
    }()
    
    func apply() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems( Country.all() )
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
        if let country = dataSource.itemIdentifier(for: indexPath) {
            print("didSelect \(country.name)")
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}
