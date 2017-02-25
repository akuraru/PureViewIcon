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
        
        top.snp.updateConstraints { [weak self] (make) in
            make.height.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
        left.snp.updateConstraints { [weak self] (make) in
            make.width.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
        right.snp.updateConstraints { [weak self] (make) in
            make.width.equalTo(self!.view.superview!).multipliedBy(self!.width / 34)
        }
        bottom.snp.updateConstraints { [weak self] (make) in
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
    case none, home, mail, rss, hamburger
}

@objc(PVIView)
public class PVIView: UIView {
    let base = UIView()
    let before = BorderView()
    let main = BorderView()
    let after = BorderView()
    @IBInspectable public var type: Int = 0
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        self.addSubview(base)
        base.clipsToBounds = true
        
        base.addSubview(before.view)
        before.setup()
        base.addSubview(main.view)
        main.setup()
        base.addSubview(after.view)
        after.setup()
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
        }
    }
    func makeHomeConstraints() {
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        // before
        before.top.isHidden = false
        before.left.isHidden = false
        before.right.isHidden = true
        before.bottom.isHidden = true
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(34.0 / 32)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
        }
        before.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        
        // main
        main.top.isHidden = true
        main.left.isHidden = false
        main.right.isHidden = false
        main.bottom.isHidden = false
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1 + 12 / 34.0)
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        
        // after
        after.width = 1
        after.top.isHidden = false
        after.left.isHidden = false
        after.right.isHidden = false
        after.bottom.isHidden = true
        
        after.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(main.view)
            make.width.equalToSuperview().multipliedBy(8 / 34.0)
            make.height.equalToSuperview().multipliedBy(13 / 34.0)
        }
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    func makeMailConstraints() {
        super.awakeFromNib()
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        // before
        before.top.isHidden = true
        before.left.isHidden = true
        before.right.isHidden = false
        before.bottom.isHidden = false
        
        before.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.65)
            make.width.equalToSuperview().multipliedBy(15.5 / 34.0)
            make.height.equalToSuperview().multipliedBy(15.5 / 34.0)
        }
        
        before.view.transform = CGAffineTransform(a: 1, b: CGFloat(M_PI) * -2 / 18, c: CGFloat(M_PI) * -1 / 18, d: 1, tx: 0, ty: 0).concatenating(CGAffineTransform(rotationAngle: CGFloat(M_PI) * 5 / 18))
        
        // main
        main.top.isHidden = false
        main.left.isHidden = false
        main.right.isHidden = false
        main.bottom.isHidden = false
        
        main.view.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(28 / 34.0)
            make.height.equalToSuperview().multipliedBy(18 / 34.0)
        }
        
        // after
        after.top.isHidden = false
        after.left.isHidden = false
        after.right.isHidden = false
        after.bottom.isHidden = false

        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    func makeRssConstraints() {
        super.awakeFromNib()
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(22 / 34.0)
            make.height.equalToSuperview().multipliedBy(22 / 34.0)
            make.center.equalToSuperview()
        }
        
        // before
        before.top.isHidden = true
        before.left.isHidden = true
        before.right.isHidden = true
        before.bottom.isHidden = true
        
        before.view.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(6 / 22.0)
            make.height.equalToSuperview().multipliedBy(6 / 22.0)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        // main
        main.top.isHidden = true
        main.left.isHidden = true
        main.right.isHidden = true
        main.bottom.isHidden = true
        
        main.view.snp.makeConstraints { [weak base] (make) in
            make.centerX.equalToSuperview().multipliedBy(3 / 22.0)
            make.centerY.equalToSuperview().multipliedBy(41 / 22.0)
            make.width.equalToSuperview().multipliedBy(26 / 22.0)
            make.height.equalToSuperview().multipliedBy(26 / 22.0)
        }
        
        // after
        after.top.isHidden = true
        after.left.isHidden = true
        after.right.isHidden = true
        after.bottom.isHidden = true
        
        after.view.snp.makeConstraints { [weak base] (make) in
            make.centerX.equalTo(base!.snp.left)
            make.centerY.equalTo(base!.snp.bottom)
            make.width.equalToSuperview().multipliedBy(2)
            make.height.equalToSuperview().multipliedBy(2)
        }
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    func makeHamburgerConstraints() {
        super.awakeFromNib()
        base.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        // before
        before.top.isHidden = false
        before.left.isHidden = true
        before.right.isHidden = true
        before.bottom.isHidden = true
        
        before.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(2 / 34.0)
        }
        
        // main
        main.top.isHidden = false
        main.left.isHidden = true
        main.right.isHidden = true
        main.bottom.isHidden = false
        
        main.view.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(20 / 34.0)
            make.height.equalToSuperview().multipliedBy(14 / 34.0)
        }
        
        // after
        after.top.isHidden = true
        after.left.isHidden = true
        after.right.isHidden = true
        after.bottom.isHidden = true
        
        setLine(.white)
        self.backgroundColor = UIColor.red
    }
    
    public override func layoutSubviews() {
        switch PVIViewType(rawValue: type)! {
        case .none:
            return
        case .home:
            return
        case .mail:
            return
        case .rss:
            rssLayoutSubview()
        case .hamburger:
            return
        }
    }
    func rssLayoutSubview() {
        super.layoutSubviews()
        
        before.view.layer.borderWidth = self.frame.width * 3 / 34
        before.view.layer.cornerRadius = self.frame.width * 3 / 34
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 13 / 34
        
        after.view.layer.borderWidth = self.frame.width * 2 / 34
        after.view.layer.cornerRadius = self.frame.width * 22 / 34
    }
}
