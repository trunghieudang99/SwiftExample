//
//  BaseCornerRoundButton.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 18/05/2021.
//

import UIKit

class BaseCornerRoundButton: UIButton {
    
    // MARK: - UI Elements
    
    private var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    convenience init(title: String, titleColor: UIColor = .background2,
                     font: UIFont = .systemFont(ofSize: FontSize.h1.rawValue, weight: .bold),
                     backgroundColor: UIColor = UIColor.primary1, borderColor: UIColor? = nil) {
        self.init(frame: .zero)
        self.set(title: title, titleColor: titleColor, font: font,
                 backgroundColor: backgroundColor,
                 borderColor: borderColor)
    }
    
    func set(title: String, titleColor: UIColor = .background2,
             font: UIFont = .systemFont(ofSize: FontSize.h1.rawValue, weight: .bold),
             backgroundColor: UIColor = .primary1,
             borderColor: UIColor? = nil) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        
        if let borderColor = borderColor {
            self.layer.borderWidth = 1.0
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ? .primary1 : .primary1Dark
        }
    }
    
    func showLoading(_ isLoading: Bool) {
        self.activityIndicator.isHidden = !isLoading
        isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        self.isEnabled = !isLoading
    }
    
    
}
