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
    
    init() {
        top = UIView()
        left = UIView()
        right = UIView()
        bottom = UIView()
        
        top.translatesAutoresizingMaskIntoConstraints = false
        left.translatesAutoresizingMaskIntoConstraints = false
        right.translatesAutoresizingMaskIntoConstraints = false
        bottom.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTop() {
        top.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    func setupLeft() {
        left.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(2)
        }
    }
    
    func setupRight() {
        right.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(2)
        }
    }
    
    func setupBottom() {
        bottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    func setColor(color: UIColor) {
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
    let afterBorder: BorderView = BorderView()
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
//        self.addSubview(before)
        self.addSubview(main)
        main.addSubview(mainBorder.left)
        main.addSubview(mainBorder.right)
        main.addSubview(mainBorder.bottom)
//        self.addSubview(after)
        
        main.translatesAutoresizingMaskIntoConstraints = false
        
        main.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1 + 12 / 34.0)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        mainBorder.setupLeft()
        mainBorder.setupRight()
        mainBorder.setupBottom()
        
        mainBorder.setColor(color: UIColor.cyan)
        main.backgroundColor = UIColor.blue
        self.backgroundColor = UIColor.red
    }
}
