//
//  BurgerDetailCellViewModel.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 22.04.2022.
//

import Foundation
import UIKit

protocol BDCellViewModelProtocol {
    init(burger: Burger)
}

protocol BDFirstCellViewModelProtocol: BDCellViewModelProtocol {
    var burgerName: String { get }
}

protocol BDSecondCellViewModelProtocol: BDCellViewModelProtocol {
    var burgerDescription: String { get }
    var burgerIngredients: String { get }
}

class BDFirstCellViewModel: BDFirstCellViewModelProtocol {
    
    var burgerName: String {
        burger.name
    }
    
    private let burger: Burger
    
    required init(burger: Burger) {
        self.burger = burger
    }
}

class BDSecondCellViewModel: BDSecondCellViewModelProtocol {
    
    var burgerDescription: String {
        burger.description
    }
    
    var burgerIngredients: String {
        let ingredients = burger.ingredients
        return ingredients.joined(separator: ", ")
    }
    
    private let burger: Burger
    
    required init(burger: Burger) {
        self.burger = burger
    }
    
    
}
