//
//  BurgerDetailsViewModel.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 22.04.2022.
//

import Foundation

protocol BurgerDetailsViewModelProtocol {
    
    init(burger: Burger)
//    func detailCellViewModel(with indexPath: IndexPath)
//    -> BDCellViewModelProtocol
    func addToBascketViewModel() ->
        AddToBasketViewModelProtocol
    func detailFirstCellViewModel() -> BDFirstCellViewModelProtocol
    func detailSecondCellViewModel() -> BDSecondCellViewModelProtocol
    
}

class BurgerDetailsViewModel: BurgerDetailsViewModelProtocol {
    
    private let burger: Burger
    
    required init(burger: Burger) {
        self.burger = burger
    }
    
    func detailFirstCellViewModel() -> BDFirstCellViewModelProtocol {
            return BDFirstCellViewModel(burger: burger)
    }
    
    func detailSecondCellViewModel() -> BDSecondCellViewModelProtocol {
            return BDSecondCellViewModel(burger: burger)
    }
    
    func addToBascketViewModel() -> AddToBasketViewModelProtocol {
        AddToBasketViewModel(burger: burger)
    }
//    func detailCellViewModel(with indexPath: IndexPath) -> BDCellViewModelProtocol {
//
//        switch indexPath.row {
//        case 0:
//            return BDFirstCellViewModel(burger: burger)
//        default:
//            return BDSecondCellViewModel(burger: burger)
//        }
//
//    }
    
}
