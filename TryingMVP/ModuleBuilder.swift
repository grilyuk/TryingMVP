//
//  ModuleBuilder.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 13.01.2023.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMain() -> UIViewController {
        let network = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, network: network)
        view.presenter = presenter
        return view
    }
}
