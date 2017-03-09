//
//  PVICheckCircle.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func mekeCheckCircleConstraints() {
        base.snp.updateConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        base.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_4))
        
        before.setup(width: 2)
        main.setup(width: 2)
        after.setup(width: 2)
        
        // before
        before.top.alpha = 1
        before.left.alpha = 0
        before.right.alpha = 0
        before.bottom.alpha = 1
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(19 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(18 / 17.0)
            make.width.equalToSuperview().multipliedBy(14 / 34.0)
            make.height.equalToSuperview().multipliedBy(2 / 34.0)
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 0
        main.left.alpha = 0
        main.right.alpha = 0
        main.bottom.alpha = 0
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(30 / 34.0)
            make.height.equalToSuperview().multipliedBy(30 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 0
        after.left.alpha = 1
        after.right.alpha = 1
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(12 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(15 / 17.0)
            make.width.equalToSuperview().multipliedBy(2 / 34.0)
            make.height.equalToSuperview().multipliedBy(8 / 34.0)
        }
        after.view.transform = resetTransform()
    }
}
