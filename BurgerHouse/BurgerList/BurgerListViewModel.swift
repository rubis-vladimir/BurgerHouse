//
//  BurgerListViewModel.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 21.04.2022.
//

import UIKit

protocol BurgerListViewModelProtocol {
    var burgers: [Burger] { get }
    func fetchBurgers(completion: @escaping () -> Void)
    func numberOfItems() -> Int
    func cellViewModel(with indexPath: IndexPath) -> BurgerCellViewModelProtocol
    func sizeForItemAt(for view: UIView, with indexPath: IndexPath) -> CGSize
    func detailsViewModel(with indexPath: IndexPath) -> BurgerDetailsViewModelProtocol
}

class BurgerListViewModel: BurgerListViewModelProtocol {
    var burgers: [Burger] = []
    
    func fetchBurgers(completion: @escaping () -> Void) {
        NetworkManager.shared.getBurgers { burgers in
            self.burgers = burgers
            completion()
        }
    }
    
    func numberOfItems() -> Int {
        burgers.count
    }
    
    func cellViewModel(with indexPath: IndexPath) -> BurgerCellViewModelProtocol {
        let burger = burgers[indexPath.row]
        return BurgerCellViewModel.init(burger: burger)
    }
    
    func detailsViewModel(with indexPath: IndexPath) -> BurgerDetailsViewModelProtocol {
        let burger = burgers[indexPath.row]
        return BurgerDetailsViewModel.init(burger: burger)
    }
    
    func sizeForItemAt(for view: UIView, with indexPath: IndexPath) -> CGSize {
        let burger = burgers[indexPath.row]
        let image = UIImage(named: burger.name)
        
        var aspectRatio: CGFloat = 1
        if let imageWidth = image?.size.width,
           let imageHeight = image?.size.height {
            aspectRatio = imageHeight / imageWidth
            print(aspectRatio)
        }
        
        let padding: CGFloat = 20
        let itemPerRow: CGFloat = 2
        
        let paddingWidth = padding * (itemPerRow + 1)
        let availableWidth = view.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * aspectRatio + 30)
    }
    
}
