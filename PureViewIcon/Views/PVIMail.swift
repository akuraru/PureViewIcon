//
//  PVIMail.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeMailConstraints() {
        base.snp.updateConstraints { (make) in
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
        before.left.alpha = 0
        before.right.alpha = 1
        before.bottom.alpha = 1
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(11 / 17.0)
            make.width.equalToSuperview().multipliedBy(15.5 / 34.0)
            make.height.equalToSuperview().multipliedBy(15.5 / 34.0)
        }
        before.view.transform = resetTransform()
        
        before.view.transform = CGAffineTransform(a: 1, b: CGFloat(M_PI) * -2 / 18, c: CGFloat(M_PI) * -1 / 18, d: 1, tx: 0, ty: 0).concatenating(CGAffineTransform(rotationAngle: CGFloat(M_PI) * 5 / 18))
        
        // main
        main.top.alpha = 1
        main.left.alpha = 1
        main.right.alpha = 1
        main.bottom.alpha = 1
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(28 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
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
