//
//  PureViewIcon.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

struct BorderView {
    let top: UIView
    let left: UIView
    let right: UIView
    let bottom: UIView
    let width: CGFloat
    
    init(width: CGFloat = 2) {
        top = UIView()
        left = UIView()
        right = UIView()
        bottom = UIView()
        self.width = width
        
        top.translatesAutoresizingMaskIntoConstraints = false
        left.translatesAutoresizingMaskIntoConstraints = false
        right.translatesAutoresizingMaskIntoConstraints = false
        bottom.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layoutTop(_ superView: UIView) {
        superView.addSubview(top);
        top.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(width)
        }
    }
    
    func layoutLeft(_ superView: UIView) {
        superView.addSubview(left);
        left.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(width)
        }
    }
    
    func layoutRight(_ superView: UIView) {
        superView.addSubview(right);
        right.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(width)
        }
    }
    
    func layoutBottom(_ superView: UIView) {
        superView.addSubview(bottom);
        bottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(width)
        }
    }
    
    func set(color: UIColor) {
        top.backgroundColor = color
        left.backgroundColor = color
        right.backgroundColor = color
        bottom.backgroundColor = color
    }
}

@objc(PVIHomeView)
public class PVIHomeView: UIView {
    let before: UIView = UIView()
    let beforeBorder: BorderView = BorderView()
    let main: UIView = UIView()
    let mainBorder: BorderView = BorderView()
    let after: UIView = UIView()
    let afterBorder: BorderView = BorderView(width: 1)
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        // before
        self.addSubview(before)
        beforeBorder.layoutTop(before)
        beforeBorder.layoutLeft(before)
        
        before.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
        }
        before.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // main
        self.addSubview(main)
        mainBorder.layoutLeft(main)
        mainBorder.layoutRight(main)
        mainBorder.layoutBottom(main)
        
        main.translatesAutoresizingMaskIntoConstraints = false
        main.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1 + 12 / 34.0)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        
        // after
        self.addSubview(after)
        afterBorder.layoutTop(after)
        afterBorder.layoutLeft(after)
        afterBorder.layoutRight(after)
        
        after.translatesAutoresizingMaskIntoConstraints = false
        after.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(main)
            make.width.equalToSuperview().multipliedBy(8 / 34.0)
            make.height.equalToSuperview().multipliedBy(13 / 34.0)
        }
        
        beforeBorder.set(color: .white)
        mainBorder.set(color: .white)
        afterBorder.set(color: .white)
        
        self.backgroundColor = UIColor.red
    }
    
    func setLine(_ color: UIColor) {
        beforeBorder.set(color: color)
        mainBorder.set(color: color)
        afterBorder.set(color: color)
    }
}
