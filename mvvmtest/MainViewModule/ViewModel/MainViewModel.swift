//
//  MainViewModel.swift
//  mvvmtest
//
//  Created by Stanislav Terentyev on 13.04.2021.
//

protocol MainViewModelProtocol: class {
    var view: MainViewProtocol! { get set }
    
    func getOkButtonTapped(_ usd: String?)
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
}

