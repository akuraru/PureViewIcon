//
//  PVIStop.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeStopConstraints() {
        base.snp.updateConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        base.transform = resetTransform()
        
        before.setup(width: 2)
        main.setup(width: 10)
        after.setup(width: 2)
        
        // before
        before.top.alpha = 0
        before.left.alpha = 0
        before.right.alpha = 0
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 1
        main.left.alpha = 1
        main.right.alpha = 1
        main.bottom.alpha = 1
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
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
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        after.view.transform = resetTransform()
    }
}
