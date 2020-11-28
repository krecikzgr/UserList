//
//  BaseView.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        self.initialize()
    }

    func initialize() {
    }
}
