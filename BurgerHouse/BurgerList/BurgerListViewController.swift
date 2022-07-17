//
//  BurgerListViewController.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 21.04.2022.
//

import UIKit
import PinterestLayout

private let reuseIdentifier = "Cell"

class BurgerListViewController: UICollectionViewController {

    var viewModel: BurgerListViewModelProtocol! {
        didSet {
            viewModel.fetchBurgers {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        
        let nib = UINib(nibName: BurgerCell.reuseId, bundle: Bundle.main)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: BurgerCell.reuseId)
        
        viewModel = BurgerListViewModel()
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? BurgerDetailsViewController else { return }
        detailVC.viewModel = sender as? BurgerDetailsViewModelProtocol
    }
     
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.numberOfItems())
        return viewModel.numberOfItems()
       
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BurgerCell.reuseId, for: indexPath) as! BurgerCell
    
        cell.viewModel = viewModel.cellViewModel(with: indexPath)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let detailsViewModel = viewModel.detailsViewModel(with: indexPath)
        performSegue(withIdentifier: "ShowDetails", sender: detailsViewModel)
    }
}


// MARK: - UICollectionViewFlowLayout
extension BurgerListViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}

extension BurgerListViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UIImage(named: viewModel.cellViewModel(with: indexPath).burgerName)?.size.height ?? 0
    }
    
    
}
