//
//  PureViewIcon.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

class PVIBorderView {
    let view = UIView()
    let top = UIView()
    let left = UIView()
    let right = UIView()
    let bottom = UIView()
    
    init() {
        view.translatesAutoresizingMaskIntoConstraints = false
        top.translatesAutoresizingMaskIntoConstraints = false
        left.translatesAutoresizingMaskIntoConstraints = false
        right.translatesAutoresizingMaskIntoConstraints = false
        bottom.translatesAutoresizingMaskIntoConstraints = false
    }
    func setup(width: CGFloat) {
        view.addSubview(top)
        view.addSubview(left)
        view.addSubview(right)
        view.addSubview(bottom)
        
        set(width: width)
        
        addTopBorder()
        addLeftBorder()
        addRightBorder()
        addBottomBorder()
    }
    
    func set(width: CGFloat) {
        top.snp.remakeConstraints { [weak self] (make) in
            make.height.equalTo(self!.view.superview!).multipliedBy(width / 34)
        }
        left.snp.remakeConstraints { [weak self] (make) in
            make.width.equalTo(self!.view.superview!).multipliedBy(width / 34)
        }
        right.snp.remakeConstraints { [weak self] (make) in
            make.width.equalTo(self!.view.superview!).multipliedBy(width / 34)
        }
        bottom.snp.remakeConstraints { [weak self] (make) in
            make.height.equalTo(self!.view.superview!).multipliedBy(width / 34)
        }
    }
    
    func addTopBorder() {
        top.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func addLeftBorder() {
        left.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addRightBorder() {
        right.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addBottomBorder() {
        bottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func set(color: UIColor) {
        top.backgroundColor = color
        left.backgroundColor = color
        right.backgroundColor = color
        bottom.backgroundColor = color
    }
}
