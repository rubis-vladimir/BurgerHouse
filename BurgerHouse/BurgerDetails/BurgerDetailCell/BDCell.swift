//
//  BurgerDetailCell.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 22.04.2022.
//

import UIKit

class BDFirstCell: UITableViewCell {
    
    static let reuseId = "BDFirstCell"
    
    let burgerImageView = UIImageView()
    
    var viewModel: BDFirstCellViewModelProtocol! {
        didSet {
            burgerImageView.image = UIImage(named: viewModel.burgerName)
            setupUI()
        }
    }
    
    private func setupUI() {
        
        burgerImageView.translatesAutoresizingMaskIntoConstraints = false
        burgerImageView.contentMode = .scaleAspectFit
        
        addSubview(burgerImageView)
        
        burgerImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        burgerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        burgerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        burgerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

class BDSecondCell: UITableViewCell {
    
    static let reuseId = "BDSecondCell"
    
    let burgerDescription = UILabel()
    let burgerIngredients = UILabel()
    let burgerInfoStackView = UIStackView()
    
    var viewModel: BDSecondCellViewModelProtocol! {
        didSet {
//            burgerDescription.textColor = .red
            
            burgerDescription.text = viewModel.burgerDescription
            burgerIngredients.text = viewModel.burgerIngredients
            setupUI()
        }
    }
    
    private func setupUI() {
        
        burgerDescription.font = burgerDescription.font.withSize(20)
        burgerIngredients.textColor = .systemGray2
        burgerDescription.numberOfLines = 0
        burgerIngredients.numberOfLines = 0
        burgerDescription.textAlignment = .center
        burgerIngredients.textAlignment = .justified
        
        burgerInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        burgerInfoStackView.axis = .vertical
        burgerInfoStackView.spacing = 10
        
        burgerInfoStackView.addArrangedSubview(burgerDescription)
        burgerInfoStackView.addArrangedSubview(burgerIngredients)
        addSubview(burgerInfoStackView)
        
        burgerInfoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        burgerInfoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        burgerInfoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
//        burgerInfoStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
}
