//
//  AddInBasketView.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 22.04.2022.
//

import UIKit

class AddToBasketView: UIView {
    
    let numberOfPortionsLabel = UILabel()
    let priceLabel = UILabel()
    let addPortionButton = UIButton()
    let removePortionButton = UIButton()
    let addToBasketButton = UIButton()
    let generalStackView = UIStackView()
    let portionStackView = UIStackView()
    
    var viewModel: AddToBasketViewModelProtocol! {
        didSet {
            numberOfPortionsLabel.text = viewModel.numberOfPortions
            priceLabel.text = viewModel.price
            backgroundColor = .systemGray
            setupUI()
        }
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = .zero
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setupUI()
    }
    
    private func setupUI() {
        
        addPortionButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        removePortionButton.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        addToBasketButton.setTitle("В КОРЗИНУ", for: .normal)
        
        addToBasketButton.layer.cornerRadius = 10
        addToBasketButton.layer.borderColor = UIColor.red.cgColor
        addToBasketButton.layer.borderWidth = 3
        priceLabel.textAlignment = .center
        
        generalStackView.axis = .horizontal
        generalStackView.spacing = 10
        generalStackView.distribution = .fillEqually
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        portionStackView.axis = .horizontal
        portionStackView.spacing = 10
        portionStackView.distribution = .fillEqually
        
        portionStackView.addArrangedSubview(removePortionButton)
        portionStackView.addArrangedSubview(numberOfPortionsLabel)
        portionStackView.addArrangedSubview(addPortionButton)
        
        generalStackView.addArrangedSubview(portionStackView)
        generalStackView.addArrangedSubview(priceLabel)
        generalStackView.addArrangedSubview(addToBasketButton)
        
        addSubview(generalStackView)
        
        generalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        generalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        generalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        generalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        
    }
}
