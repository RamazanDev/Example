//
//  ProfileViewController.swift
//  IGid
//
//  Created Магомедов Рамазан on 24.05.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit

protocol ProfileViewInput: AlertPresentable, Loadable {
    func update(with viewModel: ProfileViewModel)
    func setTitle(_ text: String)
}

final class ProfileViewController: UIViewController {
    
    // MARK: - Locals
	
    // MARK: - Properties
    
	var presenter: ProfileViewOutput?
    
    private let tableView = UITableView()
    
    private var viewModel: ProfileViewModel?

    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setLargeStyleToNavigationBar()
        setupSubviews()
        self.view.backgroundColor = UIColor.backgroundLightGray()
        presenter?.viewIsReady()
    }
    
    // MARK: - Drawing
    
    private func setupSubviews() {
        
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cellTypes: [
            ProfileCell.self
        ])
        tableView.backgroundColor = .clear
        
        view.addSubview(tableView)
        
        tableView.edgesFromSafeArea(to: self.view)
    }
    
}


// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
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
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath)
    }
    
}


// MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    
    func update(with viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func setTitle(_ text: String) {
        self.navigationItem.title = text
        tableView.reloadData()
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
