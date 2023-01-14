//
//  DetailViewController.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
