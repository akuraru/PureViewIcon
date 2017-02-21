//
//  ViewController.swift
//  Sample
//
//  Created by akuraru on 2017/02/11.
//
//

import UIKit
import PureViewIcon

class ViewController: UICollectionViewController {
    let iconIden: [String] = [
        "PVIHomeViewCell",
        "PVIMailViewCell",
        "PVIRssViewCell",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconIden.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: iconIden[indexPath.row], for: indexPath)
    }

}

