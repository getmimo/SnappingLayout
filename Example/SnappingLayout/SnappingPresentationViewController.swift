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
        static let cellSize = CGSize(width: 200, height: 150)
    }
    
    // MARK: - Views
    
    private lazy var collectionView: UICollectionView = {
        let layout = SnappingLayout()
        layout.snapPosition = self.snappingLayoutType
        layout.scrollDirection = .horizontal
        layout.itemSize = Constants.cellSize

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsSelection = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Properties
    
    private let snappingLayoutType: SnappingLayout.SnapPositionType
    private let dataSource: [UIColor] = [
        .black,
        .blue,
        .brown,
        .cyan,
        .darkGray,
        .gray,
        .green,
        .lightGray,
        .magenta,
        .orange,
        .purple,
        .red,
        .yellow,
    ]
    
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

// MARK: - UICollectionView

extension SnappingPresentationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = dataSource[indexPath.row]
        
        return cell
    }
}

// MARK: - Private

private extension SnappingPresentationViewController {
    
    // MARK: - Setup
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        let collectionViewConstraints = [
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.cellSize.height),
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}
