//
//  PlaceCardViewController.swift
//  AppName
//
//  Created Рамазан Магомедов on 01.01.1945.
//  Copyright © 2020 Рамазан Магомедов. All rights reserved.
//

import UIKit

protocol PlaceCardViewInput: AlertPresentable, Loadable {
    func update(with viewModel: PlaceCardViewModel)
}

final class PlaceCardViewController: UIViewController {
    
    // MARK: - Locals
	
    // MARK: - Properties
    
	var presenter: PlaceCardViewOutput?
    
    private let tableView = UITableView()
    
    private var viewModel: PlaceCardViewModel?

    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func setupSubviews() {
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
}


// MARK: - UITableViewDataSource
extension PlaceCardViewController: UITableViewDataSource {
    
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
extension PlaceCardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath)
    }
}


// MARK: - PlaceCardViewInput
extension PlaceCardViewController: PlaceCardViewInput {
    
    func update(with viewModel: PlaceCardViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
