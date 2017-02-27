//
//  ViewController.swift
//  Sample
//
//  Created by akuraru on 2017/02/11.
//
//

import UIKit
import PureViewIcon

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    weak var viewController: CollectionViewController!

    let iconIden: [String] = [
        "PVIHomeViewCell",
        "PVIMailViewCell",
        "PVIRssViewCell",
        "PVIHamburgerViewCell",
    ]
    @IBAction func changeSlider(_ sender: Any) {
        let value = CGFloat(self.slider.value)
        viewController.size = CGSize(width: value, height: value)
        viewController.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "collection" {
            if let controller = segue.destination as? CollectionViewController {
                viewController = controller
            }
        }
    }
}

