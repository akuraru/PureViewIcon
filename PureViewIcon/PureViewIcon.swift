//
//  PureViewIcon.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

class BorderView {
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
        view.addSubview(top)
        top.snp.makeConstraints { [weak self] (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
    }
    
    func addLeftBorder() {
        view.addSubview(left)
        left.snp.makeConstraints { [weak self] (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
    }
    
    func addRightBorder() {
        view.addSubview(right)
        right.snp.makeConstraints { [weak self] (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
    }
    
    func addBottomBorder() {
        view.addSubview(bottom)
        bottom.snp.makeConstraints { [weak self] (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
    }
    
    func set(color: UIColor) {
        top.backgroundColor = color
        left.backgroundColor = color
        right.backgroundColor = color
        bottom.backgroundColor = color
    }
}

@objc
public class PVIView: UIView {
    let base = UIView()
    let before = BorderView()
    let main = BorderView()
    let after = BorderView()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addSubview(base)
        base.clipsToBounds = true
    }
    
    func setLine(_ color: UIColor) {
        before.set(color: color)
        main.set(color: color)
        after.set(color: color)
        
        before.view.layer.borderColor = color.cgColor
        main.view.layer.borderColor = color.cgColor
        after.view.layer.borderColor = color.cgColor
    }
}

@objc(PVIHomeView)
public class PVIHomeView: PVIView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        // before
        base.addSubview(before.view)
        before.addTopBorder()
        before.addLeftBorder()
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(34.0 / 32)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
        }
        before.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // main
        base.addSubview(main.view)
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
        after.width = 1
        base.addSubview(after.view)
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
}

@objc(PVIMailView)
public class PVIMailView: PVIView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        // before
        base.addSubview(before.view)
        before.addRightBorder()
        before.addBottomBorder()
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.65)
            make.width.equalToSuperview().multipliedBy(15.5 / 34.0)
            make.height.equalToSuperview().multipliedBy(15.5 / 34.0)
        }
        
        before.view.transform = CGAffineTransform(a: 1, b: CGFloat(M_PI) * -2 / 18, c: CGFloat(M_PI) * -1 / 18, d: 1, tx: 0, ty: 0).concatenating(CGAffineTransform(rotationAngle: CGFloat(M_PI) * 5 / 18))
        
        // main
        base.addSubview(main.view)
        main.addTopBorder()
        main.addLeftBorder()
        main.addRightBorder()
        main.addBottomBorder()
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(28 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        
        // after

        setLine(.white)
        self.backgroundColor = UIColor.red
    }
}

@objc(PVIRssView)
public class PVIRssView: PVIView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
            make.center.equalToSuperview()
        }
        
        // before
        base.addSubview(before.view)
        
        before.view.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(6 / 22.0)
            make.height.equalToSuperview().multipliedBy(6 / 22.0)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        // main
        base.addSubview(main.view)
        
        main.view.snp.makeConstraints { [weak base] (make) in
            make.centerX.equalToSuperview().multipliedBy(3 / 22.0)
            make.centerY.equalToSuperview().multipliedBy(41 / 22.0)
            make.width.equalToSuperview().multipliedBy(26 / 22.0)
            make.height.equalToSuperview().multipliedBy(26 / 22.0)
        }
        
        // after
        base.addSubview(after.view)
        
        after.view.snp.makeConstraints { [weak base] (make) in
            make.centerX.equalTo(base!.snp.left)
            make.centerY.equalTo(base!.snp.bottom)
            make.width.equalToSuperview().multipliedBy(2)
            make.height.equalToSuperview().multipliedBy(2)
        }
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        before.view.layer.borderWidth = self.frame.width * 3 / 34
        before.view.layer.cornerRadius = self.frame.width * 3 / 34
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 13 / 34
        
        after.view.layer.borderWidth = self.frame.width * 2 / 34
        after.view.layer.cornerRadius = self.frame.width * 22 / 34
    }
}


@objc(PVIHamburgerView)
public class PVIHamburgerView: PVIView {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        // before
        base.addSubview(before.view)
        before.addTopBorder()
        
        before.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(2 / 34.0)
        }
        
        // main
        base.addSubview(main.view)
        main.addTopBorder()
        main.addBottomBorder()
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(14 / 34.0)
        }
        
        // after
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
}
