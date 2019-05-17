//
//  CategoriesViewController.swift
//  HeadySAT
//
//  Created by Ravindra Kumbhar on 16/05/19.
//  Copyright © 2019 Ravindra Kumbhar. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let collectionViewPadding : CGFloat = 2.0
    let numberOfCellsInCollectionView : CGFloat = 3.0
    @IBOutlet weak var collectionView: UICollectionView!
    
    let apiService = APIService()
     var modelData : HeadyModels?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        apiService.fetchCategories(by:URL(string: BASE_URL)!) { (apiResult) in
            
            
             DispatchQueue.main.async {
                switch apiResult {
                case .success(let categories):
                    self.modelData = categories
                     self.collectionView.reloadData()
                     print(categories)
                case .failure(let error): break
                   // showAlert(ERROR_TITLE, message: error.localizedDescription)
                }
            //    self.homePresenter?.finishLoading()
            }
   
        }
 
    }
    
}

extension CategoriesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.modelData?.categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.lblName.text = self.modelData?.categories?[indexPath.row].name
        cell.imgView.layer.masksToBounds = true
        cell.imgView.layer.cornerRadius = cell.imgView.bounds.height/2
        cell.imgView.layer.borderColor = UIColor.red.withAlphaComponent(0.4).cgColor
        cell.imgView.layer.borderWidth = 1
        cell.cornerView.layer.cornerRadius = 3
        return cell
    }
    
}

extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
        
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CategotyListViewController") as? CategotyListViewController {
//            vc.categories = self.modelData?.categories?[indexPath.row]
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
}


extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewPadding
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: collectionViewPadding, left: collectionViewPadding, bottom: collectionViewPadding, right: collectionViewPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  collectionViewPadding * (numberOfCellsInCollectionView+1)
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/numberOfCellsInCollectionView, height: collectionViewSize/numberOfCellsInCollectionView)
    }
    
}
