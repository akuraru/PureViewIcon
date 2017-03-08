//
//  PVICrop.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeCropConstraints() {
        base.snp.updateConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        base.transform = resetTransform()
        
        before.setup(width: 2)
        main.setup(width: 2)
        after.setup(width: 1)
        
        // before
        before.top.alpha = 1
        before.left.alpha = 0
        before.right.alpha = 1
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(14 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(20 / 17.0)
            make.width.equalToSuperview().multipliedBy(21 / 34.0)
            make.height.equalToSuperview().multipliedBy(21 / 34.0)
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 0
        main.left.alpha = 1
        main.right.alpha = 0
        main.bottom.alpha = 1
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(20 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(14 / 17.0)
            make.width.equalToSuperview().multipliedBy(21 / 34.0)
            make.height.equalToSuperview().multipliedBy(21 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 1
        after.left.alpha = 0
        after.right.alpha = 0
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(27 / 34.0)
            make.height.equalToSuperview().multipliedBy(1 / 34.0)
        }
        after.view.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_4))
    }
}
