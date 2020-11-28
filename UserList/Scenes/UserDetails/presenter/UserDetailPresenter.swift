//
//  UserDetailsPresenter.swift
//  UserList
//
//  Created by Adrian Kaleta on 27/11/2020.
//

import Foundation

class UserDetailsPresenter: UserDetailsPresenterProtocol {
    
    // MARK: - Private properties
    
    weak private var view: UserDetailsViewProtocol?
    private var id: String?
    private var source: ApiSource?
    private var githubAPI = GithubAPI()
    private var dailymotionAPI = DailymotionAPI()
    
    init(view: UserDetailsViewProtocol) {
        self.view = view
    }
    
    // MARK: - Public methods
    
    func getData() {
        guard let source = source,
              let id = id else {
            view?.presentError(message: "No source detected")
            return
        }
        switch source {
        case .dailymotion:
            dailymotionAPI.getDetails(id: id) { [weak self] (result) in
                switch result {
                case .success(let user):
                    let userDetails = UserDetailViewModel(user)
                    self?.view?.setDataOnView(userDetails)
                case .failure(let error):
                    self?.view?.presentError(message: "\(error)")
                }
            }
        case .github:
            githubAPI.getDetails(id: id) { [weak self] (result) in
                switch result {
                case .success(let user):
                    let userDetails = UserDetailViewModel(user)
                    self?.view?.setDataOnView(userDetails)
                case .failure(let error):
                    self?.view?.presentError(message: "\(error)")
                }
            }
        }
    }
    
    func setId(_ id: String?) {
        self.id = id
    }
    
    func setSource(_ source: ApiSource?) {
        self.source = source
    }
    
    // MARK: - Private methods
    
    
    private func setDataOnView(_ user: UserDetailViewModel) {
        view?.setDataOnView(user)
    }
}
