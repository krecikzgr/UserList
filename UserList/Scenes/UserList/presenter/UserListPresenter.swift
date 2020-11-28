//
//  UserListPresenter.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation

class UserListPresenter: UserListPresenterProtocol {
    
    // MARK: - Private properties
    
    weak private var view: UserListViewProtocol?
    private var githubApi:GithubAPI
    private var dailymotionApi: DailymotionAPI
    private var currentSearchResults: [User] = []
    private var showOnlyFavorites: Bool = false
    
    init(view: UserListViewProtocol,
         api: GithubAPI = GithubAPI(),
         dailymotionApi: DailymotionAPI = DailymotionAPI()) {
        self.view = view
        self.githubApi = api
        self.dailymotionApi = dailymotionApi
    }
    
    // MARK: - Public methods
    
    func refreshUserList() {
        currentSearchResults = []
        let taskGroup = DispatchGroup()
        taskGroup.enter()
        githubApi.getUsers { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.view?.presentError(message: "Could not download items \(error)")
            case .success(let searchResults):
                self?.currentSearchResults.append(contentsOf: searchResults.map({User($0)}))
                taskGroup.leave()
            }
        }
        
        taskGroup.enter()
        dailymotionApi.getUsers { [weak self] result in
            switch result {
            case .failure(let error):
                self?.view?.presentError(message: "Could not download items \(error)")
            case .success(let searchResults):
                let dailymotionUsers = searchResults.list?.compactMap({User($0)}) ?? []
                self?.currentSearchResults.append(contentsOf: dailymotionUsers)
                taskGroup.leave()
            }
        }
        
        taskGroup.notify(queue: .main) { [weak self] in
            self?.setDataOnView()
        }
    }
    
    // MARK: - Private methods
    
    private func setDataOnView() {
        var viewModels = currentSearchResults.map({UserListViewModel(user: $0)})
        view?.presentUsers(viewModels)
    }
}
