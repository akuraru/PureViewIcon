//
//  PureViewIcon.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

struct BorderView {
    let view = UIView()
    let top = UIView()
    let left = UIView()
    let right = UIView()
    let bottom = UIView()
    var width: CGFloat
    
    init(width: CGFloat = 2) {
        self.width = width
        
        view.translatesAutoresizingMaskIntoConstraints = false
        top.translatesAutoresizingMaskIntoConstraints = false
        left.translatesAutoresizingMaskIntoConstraints = false
        right.translatesAutoresizingMaskIntoConstraints = false
        bottom.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addTopBorder() {
        view.addSubview(top);
        top.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(width)
        }
    }
    
    func addLeftBorder() {
        view.addSubview(left);
        left.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(width)
        }
    }
    
    func addRightBorder() {
        view.addSubview(right);
        right.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(width)
        }
    }
    
    func addBottomBorder() {
        view.addSubview(bottom);
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
    let before = BorderView()
    let main = BorderView()
    let after = BorderView(width: 1)
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        // before
        self.addSubview(before.view)
        before.addTopBorder()
        before.addLeftBorder()
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
        }
        before.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // main
        self.addSubview(main.view)
        main.addLeftBorder()
        main.addRightBorder()
        main.addBottomBorder()
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1 + 12 / 34.0)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        
        // after
        self.addSubview(after.view)
        after.addTopBorder()
        after.addLeftBorder()
        after.addRightBorder()
        
        after.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(main.view)
            make.width.equalToSuperview().multipliedBy(8 / 34.0)
            make.height.equalToSuperview().multipliedBy(13 / 34.0)
        }
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    func setLine(_ color: UIColor) {
        before.set(color: color)
        main.set(color: color)
        after.set(color: color)
    }
}
