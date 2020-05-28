//
//  PlacesViewController.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol PlacesViewInput: AlertPresentable, Loadable {
    func update(with viewModel: PlacesViewModel)
}

final class PlacesViewController: UIViewController {
    
    // MARK: - Locals
    
    // MARK: - Properties
    
    var presenter: PlacesViewOutput?
    
    private let tableView = UITableView()
    
    private var viewModel: PlacesViewModel?
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.backgroundLightGray()
        setupSubviews()
        setLargeStyleToNavigationBar()
        self.navigationItem.title = Localized.placesSelectRide()
        presenter?.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateVisibleLabelPositions()
    }
    
    
    // MARK: - Drawing
    
    private func setupSubviews() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cellTypes: [
            PlaceCell.self
        ])
        
        view.addSubview(tableView)
        
        tableView.edgesFromSafeArea(to: self.view)
    }
    
    private func updateLabelPosition(_ cell: PlaceCell) {
        let point = view.convert(cell.distanceLabel.frame.origin, from: cell.contentView) // 1
        let ratio = point.y
        let constraint = -((self.view.bounds.height - ratio) / 27)
        
        cell.distanceBottomConstraint.constant = constraint
    }
    
    private func updateVisibleLabelPositions() {
        var placeCells: [PlaceCell] = []
        
        for cell in tableView.visibleCells {
            guard let cell = cell as? PlaceCell else { return }
            placeCells.append(cell)
        }
        
        placeCells.forEach{ updateLabelPosition($0)}
    }
    
}


// MARK: - UITableViewDataSource
extension PlacesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.rows[safe: indexPath.row] else {
            assertionFailure("Failed to init cell in \(className)")
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        row.configurator.configure(cell: cell)
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard  let tableViewCell = cell as? PlaceCell else { return }
        updateLabelPosition(tableViewCell)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateVisibleLabelPositions()
    }
//    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.navigationController?.navigationBar.prefersLargeTitles = (velocity.y < 0)
//        })
//    }
    
}


// MARK: - PlacesViewInput
extension PlacesViewController: PlacesViewInput {
    
    func update(with viewModel: PlacesViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
