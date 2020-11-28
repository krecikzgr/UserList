//
//  UserDetailsRowElement.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit

class UserDetailsRowElement: BaseView {
    
    // MARK: - Private properties
    
    var topLabel: UILabel = UILabel()
    var identifier: String = ""
    
    override func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.initTopLabel()
    }
    
    // MARK: - Private methods
    
    private func initTopLabel() {
        self.topLabel.textColor = UserDetailsStyle.RowElemet.fontColor
        
        self.addSubview(topLabel)
        
        topLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(UserDetailsStyle.RowElemet.top)
            make.left.equalToSuperview().offset(UserDetailsStyle.RowElemet.left)
            make.bottom.equalToSuperview().inset(UserDetailsStyle.RowElemet.bottom)
            make.right.equalToSuperview().inset(UserDetailsStyle.RowElemet.right)
        }
    }
}
