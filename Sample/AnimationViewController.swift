//
//  AnimationViewController.swift
//  PureViewIcon
//
//  Created by akuraru on 2017/02/26.
//
//

import UIKit
import PureViewIcon

protocol SelectIcon {
    func selectedViewIcon(index: Int)
}

class AnimationViewController: UIViewController, SelectIcon {
    @IBOutlet weak var viewIcon: PVIView!
    weak var viewController: CollectionViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "collection" {
            if let controller = segue.destination as? CollectionViewController {
                viewController = controller
                viewController.delegate = self
            }
        }
    }
    
    func selectedViewIcon(index: Int) {
        UIView.animate(withDuration: 1.0) {
            self.viewIcon.set(type: index + 1)
        }
    }
}
