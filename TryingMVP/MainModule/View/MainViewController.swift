//
//  ViewController.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 13.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    
    var presenter: MainViewPresenterProtocol!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButtonAction(_ sender: Any) {
        self.presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
