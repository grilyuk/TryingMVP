//
//  DetailPresenter.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    var network: NetworkServiceProtocol
    var comment: Comment?
    
    required init(view: DetailViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.network = network
        self.comment = comment
        self.router = router
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
}
