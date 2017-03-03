//
//  PVI.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

extension PVIView {
    func makeRssConstraints() {
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
            make.center.equalToSuperview()
        }
        base.transform = resetTransform()
        
        before.setup(width: 2)
        main.setup(width: 2)
        after.setup(width: 2)
        
        // before
        before.top.alpha = 0
        before.left.alpha = 0
        before.right.alpha = 0
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(6 / 22.0)
            make.height.equalToSuperview().multipliedBy(6 / 22.0)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 0
        main.left.alpha = 0
        main.right.alpha = 0
        main.bottom.alpha = 0
        
        main.view.snp.makeConstraints { [weak base] (make) in
            make.centerX.equalToSuperview().multipliedBy(3 / 22.0)
            make.centerY.equalToSuperview().multipliedBy(41 / 22.0)
            make.width.equalToSuperview().multipliedBy(26 / 22.0)
            make.height.equalToSuperview().multipliedBy(26 / 22.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 0
        after.left.alpha = 0
        after.right.alpha = 0
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { [weak base] (make) in
            make.centerX.equalTo(base!.snp.left)
            make.centerY.equalTo(base!.snp.bottom)
            make.width.equalToSuperview().multipliedBy(2)
            make.height.equalToSuperview().multipliedBy(2)
        }
        after.view.transform = resetTransform()
    }
    
    func rssLayoutSubview() {
        before.view.layer.borderWidth = self.frame.width * 3 / 34
        before.view.layer.cornerRadius = self.frame.width * 3 / 34
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 13 / 34
        
        after.view.layer.borderWidth = self.frame.width * 2 / 34
        after.view.layer.cornerRadius = self.frame.width * 22 / 34
    }
}
