//
//  UserDetailsConctract.swift
//  UserList
//
//  Created by Adrian Kaleta on 27/11/2020.
//

import Foundation

protocol UserDetailsPresenterProtocol: class {
    func setId(_ id: String?)
    func setSource( _ source: ApiSource?)
    func getData()
}

protocol UserDetailsViewProtocol: class {
    func setDataOnView(_ user: UserDetailViewModel)
    func presentError(message: String)
}
