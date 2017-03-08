//
//  PVIForbidden.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeForbiddenConstraints() {
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
        before.top.alpha = 1
        before.left.alpha = 0
        before.right.alpha = 0
        before.bottom.alpha = 1
        
        before.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(24 / 34.0)
            make.height.equalToSuperview().multipliedBy(4 / 34.0)
        }
        before.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // main
        main.top.alpha = 0
        main.left.alpha = 0
        main.right.alpha = 0
        main.bottom.alpha = 0
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(28 / 34.0)
            make.height.equalToSuperview().multipliedBy(28 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 0
        after.left.alpha = 0
        after.right.alpha = 0
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        after.view.transform = resetTransform()
    }
    func forbiddenLayoutSubviews() {
        before.view.layer.borderWidth = 0
        before.view.layer.cornerRadius = 0
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 14 / 34
        
        after.view.layer.borderWidth = 0
        after.view.layer.cornerRadius = 0
    }
}
