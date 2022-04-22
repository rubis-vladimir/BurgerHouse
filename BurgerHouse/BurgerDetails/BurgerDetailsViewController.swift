//
//  BurgerDetailsViewController.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 22.04.2022.
//

import UIKit

class BurgerDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToBasketView: AddToBasketView!
    
    var viewModel: BurgerDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToBasketView.viewModel = viewModel.addToBascketViewModel()
        tableView.register(BDFirstCell.self, forCellReuseIdentifier: BDFirstCell.reuseId)
        tableView.register(BDSecondCell.self, forCellReuseIdentifier: BDSecondCell.reuseId)
        
    }
}

extension BurgerDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BDFirstCell.reuseId, for: indexPath) as! BDFirstCell
            
//            self.viewModel
            cell.viewModel = viewModel.detailFirstCellViewModel()
            print("\(cell.viewModel.burgerName) +++")
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: BDSecondCell.reuseId, for: indexPath) as! BDSecondCell
            
            cell.viewModel = viewModel.detailSecondCellViewModel()
            print("\(cell.viewModel.burgerIngredients) +++")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
