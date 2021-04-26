//
//  MainViewController.swift
//  mvvmtest
//
//  Created by Stanislav Terentyev on 13.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol!
    
    @IBOutlet private var usdTF: UITextField!
    @IBOutlet private var rubTF: UITextField!
    @IBOutlet private var USDImage: UIImageView!
    @IBOutlet weak var RUBImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel(view: self)
        viewModel.setupImageView(USDImage, RUBImage)
    }

    @IBAction func okButtonTapped(_ sender: Any) {
        viewModel.getOkButtonTapped(usdTF.text)
    }
}

extension MainViewController: MainViewProtocol {
    func setToRub(text: String) {
        DispatchQueue.main.async {
            self.rubTF.text = text
        }
    }
}

