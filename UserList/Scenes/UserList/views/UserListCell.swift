//
//  UserListCell.swift
//  GitHub
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit
import SnapKit
import Kingfisher

class UserListCell: UITableViewCell {
    
    // MARK: - Outlets
    
    var titleLabel: UILabel?
    var icon: UIImageView?
    var sourceLabel: UILabel?
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override func prepareForReuse() {
        icon?.image = .image(.personPlaceholder)
    }
    
    // MARK: - Private methods
    
    private func initialize() {
        initImageView()
        initTitleLabel()
        initSourceLabel()
    }
    
    private func initImageView() {
        icon = UIImageView()
        contentView.addSubview(icon!)
        
        icon?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(UserListCellStyle.Icon.top)
            make.left.equalToSuperview().offset(UserListCellStyle.Icon.left)
            make.bottom.equalToSuperview().inset(UserListCellStyle.Icon.bottom)
            make.centerY.equalToSuperview()
            make.size.equalTo(UserListCellStyle.Icon.size).priority(950)
        })
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        
        contentView.addSubview(titleLabel!)
        
        titleLabel?.snp.makeConstraints({ [unowned self] (make) in
            make.left.equalTo(self.icon!.snp.right)
            make.centerY.equalToSuperview()
        })
    }
    
    private func initSourceLabel() {
        sourceLabel = UILabel()
        sourceLabel?.textColor = UserListCellStyle.Source.color
        sourceLabel?.textAlignment = UserListCellStyle.Source.textAlignment
        
        contentView.addSubview(sourceLabel!)
        
        sourceLabel?.snp.makeConstraints({ [unowned self] (make) in
            make.left.equalTo(self.titleLabel!.snp.right)
            make.right.equalToSuperview().inset(UserListCellStyle.Source.right)
            make.width.equalTo(UserListCellStyle.Source.width)
            make.centerY.equalToSuperview()
        })
    }
    
    // MARK: - Public methods
    
    func configure(_ user: UserListViewModel) {
        titleLabel?.text = user.name
        sourceLabel?.text = user.source?.getDescription()
        
        guard let urlString = user.avatarUrl,
              let url = URL(string: urlString) else {
            return
        }
        icon?.kf.setImage(with:url)
    }
}
