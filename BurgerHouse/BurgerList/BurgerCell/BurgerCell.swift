//
//  BurgerCell.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 21.04.2022.
//

import UIKit

class BurgerCell: UICollectionViewCell {

    @IBOutlet weak var burgerImageView: UIImageView!
    @IBOutlet weak var burgerNameLabel: UILabel!
    
    static let reuseId: String = "BurgerCell"
    
    var viewModel: BurgerCellViewModelProtocol! {
        didSet {
            burgerNameLabel.text = viewModel.burgerName
            self.burgerImageView.image = UIImage(named: viewModel.burgerName)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
