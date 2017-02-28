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
    var width: CGFloat = 2
    
    init() {
        view.translatesAutoresizingMaskIntoConstraints = false
        top.translatesAutoresizingMaskIntoConstraints = false
        left.translatesAutoresizingMaskIntoConstraints = false
        right.translatesAutoresizingMaskIntoConstraints = false
        bottom.translatesAutoresizingMaskIntoConstraints = false
    }
    func setup() {
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
        self.width = width
        
        top.snp.remakeConstraints { [weak self] (make) in
            make.height.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
        left.snp.remakeConstraints { [weak self] (make) in
            make.width.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
        right.snp.remakeConstraints { [weak self] (make) in
            make.width.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
        bottom.snp.remakeConstraints { [weak self] (make) in
            make.height.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
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

public enum PVIViewType: Int {
    case none, home, mail, rss, hamburger, plus
}

@objc(PVIView)
public class PVIView: UIView {
    let base = UIView()
    let before = BorderView()
    let main = BorderView()
    let after = BorderView()
    @IBInspectable public var type: Int = 0
    
    public func set(type: Int) {
        self.type = type
        makeConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        self.addSubview(base)
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        base.clipsToBounds = true
        
        base.addSubview(before.view)
        base.addSubview(main.view)
        base.addSubview(after.view)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        makeConstraints()
    }
    
    func setLine(_ color: UIColor) {
        before.set(color: color)
        main.set(color: color)
        after.set(color: color)
        
        before.view.layer.borderColor = color.cgColor
        main.view.layer.borderColor = color.cgColor
        after.view.layer.borderColor = color.cgColor
    }
    func makeConstraints() {
        base.snp.removeConstraints()
        before.view.snp.removeConstraints()
        main.view.snp.removeConstraints()
        after.view.snp.removeConstraints()
        
        switch PVIViewType(rawValue: type)! {
        case.none:
            return
        case .home:
            makeHomeConstraints()
        case .mail:
            makeMailConstraints()
        case .rss:
            makeRssConstraints()
        case .hamburger:
            makeHamburgerConstraints()
        case .plus:
            makePlusConstraints()
        }
        layoutSubviews()
    }
    func makeHomeConstraints() {
        base.snp.updateConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        before.setup()
        main.setup()
        after.setup()
        
        // before
        before.top.alpha = 1
        before.left.alpha = 1
        before.right.alpha = 0
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(34.0 / 32)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
        }
        before.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // main
        main.top.alpha = 0
        main.left.alpha = 1
        main.right.alpha = 1
        main.bottom.alpha = 1
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1 + 12 / 34.0)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.width = 1
        after.top.alpha = 1
        after.left.alpha = 1
        after.right.alpha = 1
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(main.view)
            make.width.equalToSuperview().multipliedBy(8 / 34.0)
            make.height.equalToSuperview().multipliedBy(13 / 34.0)
        }
        after.view.transform = resetTransform()
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    func makeMailConstraints() {
        base.snp.updateConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        before.setup()
        main.setup()
        after.setup()
        
        // before
        before.top.alpha = 0
        before.left.alpha = 0
        before.right.alpha = 1
        before.bottom.alpha = 1
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.65)
            make.width.equalToSuperview().multipliedBy(15.5 / 34.0)
            make.height.equalToSuperview().multipliedBy(15.5 / 34.0)
        }
        before.view.transform = resetTransform()

        before.view.transform = CGAffineTransform(a: 1, b: CGFloat(M_PI) * -2 / 18, c: CGFloat(M_PI) * -1 / 18, d: 1, tx: 0, ty: 0).concatenating(CGAffineTransform(rotationAngle: CGFloat(M_PI) * 5 / 18))
        
        // main
        main.top.alpha = 1
        main.left.alpha = 1
        main.right.alpha = 1
        main.bottom.alpha = 1
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(28 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 0
        after.left.alpha = 0
        after.right.alpha = 0
        after.bottom.alpha = 0
        
        after.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(0)
        }
        
        after.view.transform = resetTransform()

        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    func makeRssConstraints() {
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
            make.center.equalToSuperview()
        }
        before.setup()
        main.setup()
        after.setup()
        
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
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    func makeHamburgerConstraints() {
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        before.setup()
        main.setup()
        after.setup()
        
        // before
        before.top.alpha = 1
        before.left.alpha = 0
        before.right.alpha = 0
        before.bottom.alpha = 1
        
        before.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(14 / 34.0)
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 1
        main.left.alpha = 0
        main.right.alpha = 0
        main.bottom.alpha = 0
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(2 / 34.0)
        }
        main.view.transform = resetTransform()
        
        // after
        after.top.alpha = 0
        after.left.alpha = 0
        after.right.alpha = 0
        after.bottom.alpha = 0
        
        after.view.transform = resetTransform()
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    func makePlusConstraints() {
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        before.setup()
        main.setup()
        after.setup()
        
        // before
        before.top.alpha = 1
        before.left.alpha = 0
        before.right.alpha = 0
        before.bottom.alpha = 0
        
        before.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(2 / 34.0)
        }
        before.view.transform = resetTransform()
        
        // main
        main.top.alpha = 0
        main.left.alpha = 1
        main.right.alpha = 0
        main.bottom.alpha = 0
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(2 / 34.0)
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
            make.size.equalTo(0)
        }
        
        after.view.transform = resetTransform()
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        switch PVIViewType(rawValue: type)! {
        case .none:
            resetLayoutSubviews()
        case .home:
            resetLayoutSubviews()
        case .mail:
            resetLayoutSubviews()
        case .rss:
            rssLayoutSubview()
        case .hamburger:
            resetLayoutSubviews()
        case .plus:
            resetLayoutSubviews()
        }
    }
    func resetLayoutSubviews() {
        before.view.layer.borderWidth = 0
        before.view.layer.cornerRadius = 0
        
        main.view.layer.borderWidth = 0
        main.view.layer.cornerRadius = 0
        
        after.view.layer.borderWidth = 0
        after.view.layer.cornerRadius = 0
    }
    func rssLayoutSubview() {
        before.view.layer.borderWidth = self.frame.width * 3 / 34
        before.view.layer.cornerRadius = self.frame.width * 3 / 34
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 13 / 34
        
        after.view.layer.borderWidth = self.frame.width * 2 / 34
        after.view.layer.cornerRadius = self.frame.width * 22 / 34
    }
    func resetTransform() -> CGAffineTransform {
        return CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
    }
}
