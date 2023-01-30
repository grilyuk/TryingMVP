//
//  MainPresenter.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 13.01.2023.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}


protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnComment(comment: Comment?)
}


class MainPresenter: MainViewPresenterProtocol {
    
    var comments: [Comment]?
    
    var router: RouterProtocol
    weak var view: MainViewProtocol?
    let network: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.network = network
        self.router = router
        getComments()
    }
    
    func tapOnComment(comment: Comment?) {
        router.showDetail(comment: comment)
    }
    
    func getComments() {
        network.getComments(completion: { [weak self] result in
            guard self != nil else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self?.comments = comments
                    self?.view?.success()
                    
                case.failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        })
    }
}
