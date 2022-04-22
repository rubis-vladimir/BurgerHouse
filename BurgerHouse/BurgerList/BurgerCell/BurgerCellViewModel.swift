//
//  BurgerCellViewModel.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 21.04.2022.
//

import Foundation

protocol BurgerCellViewModelProtocol {
    var burgerName: String { get }
    init(burger: Burger)
}

class BurgerCellViewModel: BurgerCellViewModelProtocol {
    var burgerName: String {
        burger.name
    }
    
    private let burger: Burger
    
    required init(burger: Burger) {
        self.burger = burger
    }
}
