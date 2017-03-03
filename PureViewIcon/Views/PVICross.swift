//
//  PVI.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeCrossConstraints() {
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        base.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        before.setup(width: 2)
        main.setup(width: 2)
        after.setup(width: 2)
        
        // before
        before.top.alpha = 1
        before.left.alpha = 0
        before.right.alpha = 0
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(2 / 34.0)
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 0
        main.left.alpha = 1
        main.right.alpha = 0
        main.bottom.alpha = 0
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(2 / 34.0)
            make.height.equalToSuperview().multipliedBy(20 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 0
        after.left.alpha = 0
        after.right.alpha = 0
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(0)
        }
        
        after.view.transform = resetTransform()
    }
}
