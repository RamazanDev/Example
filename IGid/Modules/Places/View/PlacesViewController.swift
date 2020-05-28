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
    
    
    // MARK: - Drawing
    
    private func setupSubviews() {
        tableView.bounces = false
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
