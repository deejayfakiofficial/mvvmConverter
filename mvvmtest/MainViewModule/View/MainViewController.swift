//
//  MainViewController.swift
//  mvvmtest
//
//  Created by Stanislav Terentyev on 13.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol!
    
    @IBOutlet weak var usdTF: UITextField!
    @IBOutlet weak var rubTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel(view: self)
        
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

