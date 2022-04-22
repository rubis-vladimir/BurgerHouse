//
//  AddInBasketViewModel.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 22.04.2022.
//

import Foundation

protocol AddToBasketViewModelProtocol {
    var numberOfPortions: String { get }
    var price: String { get }
    init(burger: Burger)
    func addPortion()
    func removePortion()
    func addToBasket()
}

class AddToBasketViewModel: AddToBasketViewModelProtocol {
    var numberOfPortions: String {
        "1"
    }
    
    var price: String {
        "399 ₽"
    }
    
    private let burger: Burger
    required init(burger: Burger) {
        self.burger = burger
    }
    
    func addPortion() {
        
    }
    
    func removePortion() {
        
    }
    
    func addToBasket() {
        
    }
    
    
}
