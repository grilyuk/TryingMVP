//
//  ModuleBuilder.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 13.01.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController {
        let network = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let network = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, network: network, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
}
