//
//  EventListViewController.swift
//  Atter
//
//  Created by Patryk Mieszała on 19/07/2019.
//  Copyright (c) 2019 Patryk Mieszała. All rights reserved.
//

import UIKit

final class EventListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: EventListViewModel?
    var router: EventListRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Events"
        setupNewEventButon()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.viewWillAppear()
    }
}

extension EventListViewController: EventListPresenter {
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension EventListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.events.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.eventCell,
            for: indexPath),
            let event = viewModel?.events[indexPath.row] else {
                return UITableViewCell()
        }
        
        cell.setup(with: event)
        
        return cell
    }
}

private extension EventListViewController {
    func setupNewEventButon() {
        let button = UIBarButtonItem(title: "New", style: .plain, target: router, action: #selector(router?.navigateToNewEvent))
        
        navigationItem.rightBarButtonItem = button
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(R.nib.eventCell)
    }
}
