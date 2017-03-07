//
//  PVITag.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeTagConstraints() {
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
        before.right.alpha = 1
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(25.5 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(8.5 / 17.0)
            make.width.equalToSuperview().multipliedBy(13 / 34.0)
            make.height.equalToSuperview().multipliedBy(13 / 34.0)
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 0
        main.left.alpha = 1
        main.right.alpha = 1
        main.bottom.alpha = 1
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(18 / 34.0)
            make.height.equalToSuperview().multipliedBy(24 / 34.0)
        }
        main.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // after
        after.top.alpha = 0
        after.left.alpha = 0
        after.right.alpha = 0
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(23 / 17.0)
            make.centerY.equalToSuperview().multipliedBy(11 / 17.0)
            make.width.equalToSuperview().multipliedBy(7 / 34.0)
            make.height.equalToSuperview().multipliedBy(7 / 34.0)
        }
        after.view.transform = resetTransform()
    }
    
    func tagLayoutSubview() {
        before.view.layer.borderWidth = 0
        before.view.layer.cornerRadius = 0
        
        main.view.layer.borderWidth = 0
        main.view.layer.cornerRadius = 0
        
        after.view.layer.borderWidth = self.frame.width * 2 / 34
        after.view.layer.cornerRadius = self.frame.width * 3.5 / 34
    }
}
