//
//  BaseViewController.swift
//  CollectionViewTutorial
//
//  Created by Andrew Chernyhov on 17.08.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, PhotoListViewControllerDelegate {

    @IBOutlet weak var collectionContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionContainerView: UIView!
    
    @IBOutlet weak var detailsContainerView: UIView!
    
    private var collectionView:PhotoListViewController?
    private var detailsView:DetailsViewController?
    
    private var flexibleConstrints = [NSLayoutConstraint]()
    
    // MARK: - Private methods
    
    private func hideDetailsContainerView() {
       detailsContainerView.hidden = true
        NSLayoutConstraint.deactivateConstraints(flexibleConstrints)
        
    }
    
    private func showDetailsContainer() {
        detailsContainerView.hidden = false
        flexibleConstrints.append(collectionContainerHeight)
        NSLayoutConstraint.activateConstraints(flexibleConstrints)
    }
    
    private func configureUserInterface() {
        
        self.collectionView = self.storyboard?.instantiateViewControllerWithIdentifier("PhotoListViewController") as? PhotoListViewController
        
        self.collectionView?.delegate = self
        self.collectionView?.view.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        self.collectionView?.view.frame = self.collectionContainerView.bounds
        self.addChildViewController(self.collectionView!)
        self.collectionContainerView .addSubview((self.collectionView?.view)!)
        self.collectionView?.didMoveToParentViewController(self)
        
        
        self.detailsView = self.storyboard?.instantiateViewControllerWithIdentifier("DetailsViewController") as? DetailsViewController
        
        self.detailsView?.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.detailsView?.view.frame = self.detailsContainerView.bounds
        self.addChildViewController(self.detailsView!)
        self.detailsContainerView.addSubview((self.detailsView?.view)!)
        self.detailsView?.didMoveToParentViewController(self)
    }
    
    // MARK: - VC lifecycle
    
    override func viewDidLoad() {
        
        self.collectionContainerHeight.constant = CGFloat(self.view.frame.size.height - 64.0) / 2.0
        
        self.hideDetailsContainerView()
        
        self.configureUserInterface()
    }
    
    // MARK: - PhotoListViewControllerDelegate
    
    func collectionViewSelectedItem(didSelectItem item: UIImage) {
        
        self.showDetailsContainer()
        self.detailsView?.image.image = item
    }
}
