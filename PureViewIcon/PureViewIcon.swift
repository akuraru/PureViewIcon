//
//  PureViewIcon.swift
//
//  Created by akuraru on 2017/02/11.
//

import UIKit
import SnapKit

@objc(PVIView)
public class PVIView: UIView {
    let base = UIView()
    let before = PVIBorderView()
    let main = PVIBorderView()
    let after = PVIBorderView()
    @IBInspectable public var type: Int = 0
    @IBInspectable public var lineColor: UIColor = .black
    
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
        setLine(lineColor)
        super.awakeFromNib()
        makeConstraints()
    }
    
    public func setLine(_ color: UIColor) {
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
        case .none:
            makeNoneConstraints()
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
        case .cross:
            makeCrossConstraints()
        case .check:
            makeCheckConstraints()
        case .flag:
            makeFlagConstraints()
        case .caretRight:
            makeCaretRightConstraints()
        case .caretLeft:
            makeCaretLeftConstraints()
        case .caretUp:
            makeCaretUpConstraints()
        case .caretDown:
            makeCaretDownConstraints()
        case .caretRightCircle:
            makeCaretRightCircleConstraints()
        case .caretLeftCircle:
            makeCaretLeftCircleConstraints()
        case .caretUpCircle:
            makeCaretUpCircleConstraints()
        case .caretDownCircle:
            makeCaretDownCircleConstraints()
        case .caretRightSquare:
            makeCaretRightSquareConstraints()
        default:
            makeNoneConstraints()
        }
        updateLeyer()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateLeyer()
    }
    func updateLeyer() {
        switch PVIViewType(rawValue: type)! {
        case .rss:
            rssLayoutSubview()
        case .home,
             .mail,
             .hamburger,
             .plus,
             .cross,
             .check,
             .flag,
             .none:
            resetLayoutSubviews()
        case.caretRightCircle,
            .caretLeftCircle,
            .caretUpCircle,
            .caretDownCircle:
            caretCircleLayoutSubview()
        case .caretRightSquare:
            caretSquareLayoutSubview()
        default:
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
    func caretCircleLayoutSubview() {
        before.view.layer.borderWidth = 0
        before.view.layer.cornerRadius = 0
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 15 / 34
        
        after.view.layer.borderWidth = 0
        after.view.layer.cornerRadius = 0
    }
    func caretSquareLayoutSubview() {
        before.view.layer.borderWidth = 0
        before.view.layer.cornerRadius = 0
        
        main.view.layer.borderWidth = self.frame.width * 2.0 / 34
        main.view.layer.cornerRadius = self.frame.width * 4 / 34
        
        after.view.layer.borderWidth = 0
        after.view.layer.cornerRadius = 0
    }
    func resetTransform() -> CGAffineTransform {
        return CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
    }
}
