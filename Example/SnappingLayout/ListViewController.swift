//
//  ListViewController.swift
//  SnappingLayout_Example
//

import UIKit
import SnappingLayout

class ListViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    // MARK: - Properties
    
    private let cellReuseIdentifier = "cell"
    private let dataSource: [SnappingLayout.SnapPositionType] = [
        .left,
        .center,
        .right
    ]
    
    // MARK: - Life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: - UITableView

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier)!

        switch dataSource[indexPath.row] {
        case .left:
            cell.textLabel?.text = "Left snapping"
        case .center:
            cell.textLabel?.text = "Center snapping"
        case .right:
            cell.textLabel?.text = "Right snapping"
        }
        
        return cell
    }
}

// MARK: - Private

private extension ListViewController {
    
    // MARK: - Setup
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}
