//
//  UserListView.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit
import SnapKit

class UserListController: UIViewController {
    
    // MARK: - Outlets
    
    var tableView: UITableView?
    
    // MARK: - Private properties
    
    private var items: [UserListViewModel] = []
    private var presenter: UserListPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.refreshUserList()
        view.showLoading()
    }
    
    // MARK: - Initialize
    
    private func initialize() {
        initTableView()
        registerCells()
        initPresenter()
    }
    
    private func registerCells() {
        tableView?.register(cellClass: UserListCell.self)
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 43
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView!)
        
        tableView?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        })
    }

    private func initPresenter() {
        presenter = UserListPresenter(view: self)
    }
}

//---------------------------------
// MARK: - TableViewDelegate
//---------------------------------

extension UserListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: UserListCell.self,
                                                 forIndexPath: indexPath)
        cell.configure(self.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UserDetailsController()
        let user = items[indexPath.row]
        controller.configureWith(id: user.name, source: user.source)
        navigationController?.pushViewController(controller, animated: true)
    }
}

//---------------------------------
// MARK: - UserListViewProtocol conformance
//---------------------------------

extension UserListController:UserListViewProtocol {
    func presentUsers(_ users: [UserListViewModel]) {
        items = users
        tableView?.reloadData()
        view.stopLoading()
    }
    
    func presentError(message: String) {
        showError(message: message)
    }
}
