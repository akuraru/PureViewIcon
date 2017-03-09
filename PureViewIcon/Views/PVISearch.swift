//
//  PVISearch.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeSearchConstraints() {
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
        before.left.alpha = 1
        before.right.alpha = 1
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(8 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(26 / 17.0)
            make.width.equalToSuperview().multipliedBy(4 / 34.0)
            make.height.equalToSuperview().multipliedBy(11 / 34.0)
        }
        before.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // main
        main.top.alpha = 0
        main.left.alpha = 0
        main.right.alpha = 0
        main.bottom.alpha = 0
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(19 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(15 / 17.0)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
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
    func searchLayoutSubviews() {
        before.view.layer.borderWidth = 0
        before.view.layer.cornerRadius = 0
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 11 / 34
        
        after.view.layer.borderWidth = 0
        after.view.layer.cornerRadius = 0
    }
}
