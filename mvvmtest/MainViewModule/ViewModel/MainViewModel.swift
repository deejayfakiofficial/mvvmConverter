//
//  MainViewModel.swift
//  mvvmtest
//
//  Created by Stanislav Terentyev on 13.04.2021.
//
import UIKit

protocol MainViewModelProtocol: class {
    var view: MainViewProtocol! { get set }
    func getOkButtonTapped(_ usd: String?)
    func setupImageView(_ usdImageView: UIImageView, _ rubImageView: UIImageView)
}

protocol MainViewProtocol: class {
    func setToRub(text: String)
}

class MainViewModel: MainViewModelProtocol {
    
    var dollars: Double = 0
    var view: MainViewProtocol!
    var model: MainModel! {
        didSet {
            guard let course = model.rates["RUB"] else {
                return
            }
            view.setToRub(text: "\(course * dollars)")
        }
    }
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func getOkButtonTapped(_ usd: String?) {
        guard let unwrappedUsd = usd,
              let doubleUsd = Double(unwrappedUsd) else {
            print("Error!")
            return
        }
        dollars = doubleUsd
        NetworkService.shared.fetchJSON { (model) in
            self.model = model
        }
    }
    
    func setupImageView(_ usdImageView: UIImageView, _ rubImageView: UIImageView) {
        DownloadImageService.shared.setupImageView(usdImageView, rubImageView)
    }
}

