//
//  DetailsViewController.swift
//  CollectionViewTutorial
//
//  Created by Andrew Chernyhov on 17.08.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBAction func zoomIn(sender: UIBarButtonItem) {
        print("Zoom in")
    }
    
    @IBAction func zoomOut(sender: UIBarButtonItem) {
        print("Zoom out")
    }
    
    
}
