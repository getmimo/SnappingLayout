//
//  SnappingPresentationViewController.swift
//  SnappingLayout_Example
//

import UIKit
import SnappingLayout

class SnappingPresentationViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cellReuseIdentifier = "cell"
        static let cellSize = CGSize(width: 30, height: 60)
    }
    
    // MARK: - Views
    
    private lazy var collectionView: UICollectionView = {
        let layout = SnappingLayout()
        layout.snapPosition = self.snappingLayoutType
        layout.scrollDirection = .horizontal
        layout.itemSize = Constants.cellSize
        layout.minimumLineSpacing = 12

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        return collectionView
    }()
    
    // MARK: - Properties
    
    private let snappingLayoutType: SnappingLayout.SnapPositionType
    
    // MARK: - Initialization
    
    init(snappingLayoutType: SnappingLayout.SnapPositionType) {
        self.snappingLayoutType = snappingLayoutType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: - Setup

private extension SnappingPresentationViewController {
    
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        let collectionViewConstraints = [
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}
