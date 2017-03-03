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
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    var isLarge = true
    
    @IBAction func touchIcon(_ sender: Any) {
        let height: CGFloat = isLarge ? 50 : 100
        isLarge = !isLarge
        UIView.animate(withDuration: 1.0) { [weak self] in
            self!.heightConstraint.constant = height
            self!.view.layoutIfNeeded()
        }
    }
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
            self.viewIcon.set(type: index)
            self.view.layoutIfNeeded()
        }
    }
}
