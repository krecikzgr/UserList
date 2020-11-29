//
//  UserDetailsController.swift
//  UserList
//
//  Created by Adrian Kaleta on 27/11/2020.
//

import UIKit

class UserDetailsController: UIViewController {
    
    // MARK: - Private properties
    
    private var scrollView:UIScrollView?
    private var container:UIView?
    private var stackView:UIStackView?
    private var image: UserDetailsIconView?
    private var loginLabel: UserDetailsRowElement?
    private var sourceLabel: UserDetailsRowElement?
    
    private var user: User?
    private var presenter: UserDetailsPresenterProtocol?
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getData()
    }
    
    // MARK: - Configure
    
    private func initialize() {
        view.backgroundColor = .white
        initScrollView()
        initContainer()
        initStackView()
        initImageView()
        initLoginLabel()
        initSourceLabel()
        view.showLoading()
    }
    
    private func initScrollView() {
        scrollView = UIScrollView()
        
        view.addSubview(scrollView!)

        scrollView?.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    private func initContainer() {
        container = UIView()
        
        scrollView?.addSubview(container!)

        container?.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().priority(250)
            make.width.equalToSuperview()
        }
    }

    private func initStackView() {
        stackView = UIStackView()
        stackView?.axis = .vertical
        
        container?.addSubview(stackView!)

        stackView?.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
    private func initImageView() {
        image = UserDetailsIconView()
        
        stackView?.addArrangedSubview(image!)
    }
    
    private func initLoginLabel() {
        loginLabel = UserDetailsRowElement()
        
        stackView?.addArrangedSubview(loginLabel!)
    }
    
    private func initSourceLabel() {
        sourceLabel = UserDetailsRowElement()
        
        stackView?.addArrangedSubview(sourceLabel!)
    }
    
    // MARK: - Public methods
    
    func configureWith(id:String?, source: ApiSource?) {
        initPresenter()
        presenter?.setId(id)
        presenter?.setSource(source)
    }
    
    private func initPresenter() {
        presenter = UserDetailsPresenter(view: self)
    }
}

//---------------------------------
// MARK: - UserDetailsProtocol conformance
//---------------------------------

extension UserDetailsController: UserDetailsViewProtocol {
    
    func presentError(message: String) {
        view.stopLoading()
        showError(message: message)
    }
    
    func setDataOnView(_ user: UserDetailViewModel) {
        view.stopLoading()
        loginLabel?.topLabel.text = user.title
        sourceLabel?.topLabel.text = user.source?.getDescription()
        
        guard let urlString = user.avatarUrl,
              let url = URL(string: urlString) else {
            return
        }
        image?.image?.kf.setImage(with: url)
    }
}
