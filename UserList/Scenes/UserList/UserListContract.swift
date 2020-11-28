//
//  UserListContract.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation

protocol UserListPresenterProtocol: class {
    func refreshUserList()
}

protocol UserListViewProtocol:class {
    func presentUsers(_ users: [UserListViewModel])
    func presentError(message:String)
}
