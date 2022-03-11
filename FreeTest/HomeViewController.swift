//
//  ViewController.swift
//  FreeTest
//
//  Created by Mathias Erligmann on 11/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = ViewModel()
    let filterButton = UIBarButtonItem()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureFilterButton()
        configureTableView()
        
        viewModel.fetchLaunches(completion: displayLaunches)
    }
    
    // MARK: Configure
    
    private func configureTitle() {
        title = "Home"
    }
    
    private func configureFilterButton() {
        filterButton.image = UIImage(systemName: "line.3.horizontal.decrease.circle")
        filterButton.target = self
        filterButton.action = #selector(addFilter)
        navigationItem.rightBarButtonItem = filterButton
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: LaunchTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    func displayLaunches() {
        tableView.reloadData()
    }
    
    @objc func addFilter() {
        viewModel.filterByLaunchPad()
        let alert = UIAlertController(title: "Filter by Launchpad", message: "", preferredStyle: .actionSheet)
        
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.launches?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LaunchTableViewCell.cellIdentifier, for: indexPath) as? LaunchTableViewCell {
            cell.set(launch: viewModel.launches?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailViewController()
        detailVC.launch = viewModel.launches?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


