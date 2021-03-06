//
//  PVI.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeFlagConstraints() {
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        base.transform = resetTransform()
        
        before.setup(width: 2)
        main.setup(width: 2)
        after.setup(width: 2)
        
        // before
        before.top.alpha = 0
        before.left.alpha = 1
        before.right.alpha = 1
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(7 / 17.0)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(3 / 34.0)
            make.height.equalToSuperview().multipliedBy(25 / 34.0)
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 1
        main.left.alpha = 1
        main.right.alpha = 1
        main.bottom.alpha = 1
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(13 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(12 / 17.0)
            make.width.equalToSuperview().multipliedBy(14 / 34.0)
            make.height.equalToSuperview().multipliedBy(12 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 1
        after.left.alpha = 1
        after.right.alpha = 1
        after.bottom.alpha = 1
        
        after.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(22 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(14 / 17.0)
            make.width.equalToSuperview().multipliedBy(10 / 34.0)
            make.height.equalToSuperview().multipliedBy(12 / 34.0)
        }
        after.view.transform = resetTransform()
    }
}
