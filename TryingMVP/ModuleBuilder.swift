//
//  ModuleBuilder.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 13.01.2023.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
    static func createDetail(comment: Comment?) -> UIViewController
}

class ModelBuilder: Builder {
    
    static func createMain() -> UIViewController {
        let network = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, network: network)
        view.presenter = presenter
        return view
    }

    static func createDetail(comment: Comment?) -> UIViewController {
        let network = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, network: network, comment: comment)
        view.presenter = presenter
        return view
    }
}
