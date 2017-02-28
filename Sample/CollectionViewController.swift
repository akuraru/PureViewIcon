//
//  CollectionViewController.swift
//  PureViewIcon
//
//  Created by akuraru on 2017/02/25.
//
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: SelectIcon?
    var size = CGSize(width: 60, height: 60)
    
    let iconIden: [String] = [
        "PVIHomeViewCell",
        "PVIMailViewCell",
        "PVIRssViewCell",
        "PVIHamburgerViewCell",
        "PVIPlusViewCell",
        "PVICrossViewCell",
    ]
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectedViewIcon(index: indexPath.row)
    }
}
