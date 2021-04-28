import UIKit

class CollecViewController: BaseViewController {
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
            footer: "Choose a view for iphone. Zoomed shows larger controls. Standard shows more content.",
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
        
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func layout() {
        navigationItem.title = "車両画像"
        
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
    }
}

extension CollecViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return form.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return form[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        if( kind == UICollectionView.elementKindSectionHeader ){
            return collectionView.dequeueConfiguredReusableSupplementary(
                using: UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) {
                    [unowned self] (headerView, elementKind, indexPath) in
                    var config = headerView.defaultContentConfiguration()
                    config.text = self.form[ indexPath.section ].header
                    config.directionalLayoutMargins = .init(top: 20.0, leading: 0.0, bottom: 10.0, trailing: 0.0)
                    headerView.contentConfiguration = config
                },
                for: indexPath
            )
        }
        
        return collectionView.dequeueConfiguredReusableSupplementary(
            using: UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionFooter) {
                [unowned self] (footerView, elementKind, indexPath) in
                
                var config = footerView.defaultContentConfiguration()
                config.text = self.form[ indexPath.section ].footer
                config.textProperties.transform = .none
                footerView.contentConfiguration = config
            },
            for: indexPath
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UICollectionViewListCell
        let item = self.form[ indexPath.section ].items[ indexPath.row ]
        
        var content = UIListContentConfiguration.valueCell()
        content.text = item.label
        content.secondaryText = item.value
        content.image = UIImage(systemName: "globe")
        content.imageProperties.preferredSymbolConfiguration = .init(font: content.textProperties.font, scale: .large)
        
        cell.accessories = [
            .checkmark(options: .init(isHidden: false, tintColor: .systemGray)),
            .disclosureIndicator(options: .init(tintColor: .systemGray)),
            .delete(displayed: .always, options: .init(tintColor: .systemRed)),
            .reorder(displayed: .always, options: .init(tintColor: .systemGray, showsVerticalSeparator: false))
        ]
        
        cell.contentConfiguration = content
        cell.tintColor = .systemPurple
        return cell
    }
}
