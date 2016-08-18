//
//  PhotoListViewController.swift
//  CollectionViewTutorial
//
//  Created by Andrew Chernyhov on 07.08.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit

class PhotoListViewController: UICollectionViewController {

    var delegate:PhotoListViewControllerDelegate?
    private let reuseIdentifier = "PhotoCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cityPanaram = UIImage(named: "cityPanaram.png")
        let bristol = UIImage(named: "bristol.jpg")
        let futureCity = UIImage(named: "futureCity.jpg")
        let snowFall = UIImage(named: "snowFall.png")
        let nightCity = UIImage(named: "nightCity.jpg")
        let simCenter = UIImage(named: "simCenter.jpg")

        

        
        photos = [cityPanaram!, bristol!, futureCity!, snowFall!, nightCity!, simCenter!]
    }
    
    override func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let movedImage = photos.removeAtIndex(sourceIndexPath.row)
        photos.insert(movedImage, atIndex: destinationIndexPath.row)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCell
        
        cell.backgroundColor = UIColor(red: 0.01, green: 0.41, blue: 0.22, alpha: 1.0)
        cell.image.image = photos[indexPath.row]
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        delegate?.collectionViewSelectedItem(didSelectItem: photos[indexPath.row])
    }
}

extension PhotoListViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var cellSize:CGSize
        
        let image = photos[indexPath.row]
        
        
        if self.traitCollection.horizontalSizeClass == .Compact {
            cellSize = CGSizeMake(86.0, image.size.height + 10)
        } else {
            cellSize = CGSizeMake(172.0, image.size.height + 10);
        }
        
        return cellSize
    
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
}


protocol PhotoListViewControllerDelegate {
    
    func collectionViewSelectedItem(didSelectItem item: UIImage)
    
}



























