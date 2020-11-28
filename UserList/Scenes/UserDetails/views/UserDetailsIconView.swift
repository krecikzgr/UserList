//
//  UserDetailsIconView.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit
import SnapKit

class UserDetailsIconView: BaseView {
    
    var image: UIImageView?
    
    override func initialize() {
        image = UIImageView()
        
        self.addSubview(image!)
        
        image?.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(UserDetailsStyle.Icon.top)
            make.bottom.equalToSuperview().inset(UserDetailsStyle.Icon.bottom)
            make.size.equalTo(UserDetailsStyle.Icon.size)
            make.centerX.equalToSuperview()
        }
    }
}
