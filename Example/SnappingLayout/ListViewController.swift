//
//  ListViewController.swift
//  SnappingLayout_Example
//

import UIKit
import SnappingLayout

class ListViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cellReuseIdentifier = "cell"
    }
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    // MARK: - Properties

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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier)!

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedSnappingLayoutType = dataSource[indexPath.row]
        
        let viewController = SnappingPresentationViewController(snappingLayoutType: selectedSnappingLayoutType)
        navigationController?.pushViewController(viewController, animated: true)
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
