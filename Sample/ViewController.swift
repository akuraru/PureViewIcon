//
//  ViewController.swift
//  Sample
//
//  Created by akuraru on 2017/02/11.
//
//

import UIKit
import PureViewIcon

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var collectionView: UICollectionView!
    var size = CGSize(width: 34, height: 34)
    
    let iconIden: [String] = [
        "PVIHomeViewCell",
        "PVIMailViewCell",
        "PVIRssViewCell",
        "PVIHamburgerViewCell",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func changeSlider(_ sender: Any) {
        let value = CGFloat(self.slider.value)
        size = CGSize(width: value, height: value)
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return size
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconIden.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: iconIden[indexPath.row], for: indexPath)
    }

}

