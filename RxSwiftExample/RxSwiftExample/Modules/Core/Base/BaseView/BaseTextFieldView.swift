//
//  BaseTextFieldView.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit

enum BaseTextFieldViewType {
    case normal
    case email
    case password
    case phone
    case date
}

protocol BaseTextFieldViewDelegate: class {
    func datePickerDidChange(with datePicker: UIDatePicker)
}

class BaseTextFieldView: BaseView {
    
    // MARK: - Variables
    
    weak var delegate: BaseTextFieldViewDelegate?
   
    var type: BaseTextFieldViewType!
    
    var text: String? {
        get {
            return self.textField.text
        }
        set {
            self.textField.text = newValue
        }
    }

    // MARK: - UI Elements
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.maximumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.rx.controlEvent(.valueChanged)
            .asObservable()
            .subscribe(onNext: { [weak self] in
                guard let strongSelf = self else { return }
                self?.delegate?.datePickerDidChange(with: strongSelf.datePicker)
            }).disposed(by: disposeBag)
        return datePicker
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = dimension.mediumMargin
        return stackView
    }()
    
    let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue,
                                       weight: .semibold)
        label.textColor = UIColor.secondary1
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let errorTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue,
                                       weight: .regular)
        label.textColor = UIColor.primary2
        label.textAlignment = .right
        label.numberOfLines = 0
        label.isHidden = true
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 248), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 748), for: .horizontal)
        return label
    }()
    
    let borderView: BaseView = {
        let view = BaseView(frame: .zero)
        view.backgroundColor = .background2
        view.set(borderWidth: 1.0, borderColor: UIColor.secondary3, cornerRadius: 5.0)
        return view
    }()

    
    let borderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis      = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    let prefixView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    let prefixTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.secondary1
        label.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue,
                                       weight: .light)
        return label
    }()
    
    let prefixLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.secondary3
        return view
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue,
                                           weight: .light)
        textField.textColor = UIColor.secondary1
        textField.clearButtonMode = .whileEditing
        textField.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .horizontal)
        textField.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1), for: .horizontal)
        textField.rx.controlEvent(.editingDidBegin).asObservable().subscribe(onNext: { [weak self] in
            self?.hideError()
        }).disposed(by: self.disposeBag)
        
        if #available(iOS 13, *) {
            textField.overrideUserInterfaceStyle = .light
        }
        
        return textField
    }()
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "seen"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.rx.controlEvent(.touchUpInside).asObservable().subscribe(onNext: { [weak self] in
            self?.touchInShowPasswordButton()
        }).disposed(by: self.disposeBag)
        return button
    }()
    
    let errorImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.image = UIImage(named: "error")
        return imageView
    }()
    
    let errorDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: FontSize.h3.rawValue, weight: .regular)
        label.textColor = .primary2
        label.textAlignment = .right
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    // MARK: - Init
    convenience init(title: String, placeholder: String, type: BaseTextFieldViewType) {
        self.init()
        
        self.titleLabel.text = title
        self.textField.placeholder = placeholder
        self.applyType(type)
    }
    
    // MARK: - View LifeCycles
    
    override func initialize() {
        super.initialize()
        layoutContenStackView()
        layoutTopView()
        layoutErrorTitleLabel()
        layoutTitleLabel()
        layoutBorderView()
        layoutBorderStackView()
        layoutPrefixView()
        layoutPrefixTitleLabel()
        layoutPrefixLineView()
        layoutTextField()
        layoutErrorImageView()
        layoutErrorDescriptionLabel()
    }
}

// MARK: - Layout

extension BaseTextFieldView {
    
    private func layoutContenStackView() {
        self.addSubview(self.contentStackView)
        self.contentStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func layoutTopView() {
        self.contentStackView.addArrangedSubview(self.topView)
    }
    
    private func layoutErrorTitleLabel() {
        self.topView.addSubview(self.errorTitleLabel)
        self.errorTitleLabel.snp.makeConstraints { (make) in
            make.top.trailing.bottom.equalToSuperview()
        }
    }
    
    private func layoutTitleLabel() {
        self.topView.addSubview(titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.lessThanOrEqualToSuperview()
            make.leading.bottom.equalToSuperview()
            make.trailing.equalTo(self.errorTitleLabel.snp.leading)
                .offset(-dimension.mediumMargin)
        }
    }
    
    private func layoutBorderView() {
        self.contentStackView.addArrangedSubview(self.borderView)
        self.borderView.snp.makeConstraints { (make) in
            make.height.equalTo(dimension.largeMargin_48)
        }
    }
    
    private func layoutBorderStackView() {
        self.borderView.addSubview(self.borderStackView)
        self.borderStackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
                .offset(dimension.normalMargin)
            make.trailing.equalToSuperview()
                .inset(dimension.normalMargin)
        }
    }
    
    private func layoutPrefixView() {
        self.borderStackView.addArrangedSubview(self.prefixView)
    }
    
    private func layoutPrefixTitleLabel() {
        self.prefixView.addSubview(self.prefixTitleLabel)
        self.prefixTitleLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.equalToSuperview()
        }
    }
    
    private func layoutPrefixLineView() {
        self.prefixView.addSubview(self.prefixLineView)
        self.prefixLineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(dimension.smallMargin)
            make.leading.equalTo(self.prefixTitleLabel.snp.trailing).offset(dimension.normalMargin)
            make.trailing.equalToSuperview().offset(-dimension.normalMargin)
            make.bottom.equalToSuperview().offset(-dimension.smallMargin)
            make.width.equalTo(1.0)
        }
    }
    
    private func layoutTextField() {
        self.borderStackView.addArrangedSubview(self.textField)
    }
    
    private func layoutShowPasswordButton() {
        self.borderStackView.addArrangedSubview(self.showPasswordButton)
        self.showPasswordButton.snp.makeConstraints { (make) in
            make.width.equalTo(dimension.largeMargin_32)
        }
    }
    
    private func layoutErrorImageView() {
        self.borderStackView.addArrangedSubview(self.errorImageView)
        self.errorImageView.snp.makeConstraints { (make) in
            make.width.equalTo(dimension.normalMargin)
        }
    }
    
    private func layoutErrorDescriptionLabel() {
        self.contentStackView.addArrangedSubview(self.errorDescriptionLabel)
    }
    
}

// MAKR: - Support Methods

extension BaseTextFieldView {
    
    private func applyType(_ type: BaseTextFieldViewType) {
        self.type = type
        
        guard let type = self.type else { return }
        
        switch type {
        case .normal:
            self.textField.keyboardType = .default
        case .email:
            self.textField.keyboardType = .emailAddress
        case .password:
            self.textField.isSecureTextEntry = true
            self.borderStackView.removeArrangedSubview(self.errorImageView)
            self.layoutShowPasswordButton()
            self.layoutErrorImageView()
        case .phone:
            self.textField.keyboardType = .numberPad
        case .date:
            self.textField.inputView = self.datePicker
        }
    }

    
    private func touchInShowPasswordButton() {
        self.textField.isSecureTextEntry = !self.textField.isSecureTextEntry
        if self.textField.isSecureTextEntry {
            self.showPasswordButton.setImage(UIImage(named: "seen"), for: .normal)
        } else {
            self.showPasswordButton.setImage(UIImage(named: "unseen"), for: .normal)
        }
    }
}

// MARK: - Public Methods

extension BaseTextFieldView {
    
    func addPrefix(title: String) {
        self.prefixView.isHidden = false
        self.prefixTitleLabel.text = title
    }
    
    func showDefaultError() {
        self.showError(with: TextManager.required)
    }
    
    func showError(with message: String) {
        self.errorImageView.isHidden        = false
        self.errorDescriptionLabel.text     = message
        self.errorDescriptionLabel.isHidden = false
        self.borderView.set(borderWidth: 1.0, borderColor: .primary2, cornerRadius: 5.0)
    }
    
    func hideError() {
        self.errorDescriptionLabel.text     = ""
        self.errorDescriptionLabel.isHidden = true
        self.errorImageView.isHidden        = true
        self.borderView.set(borderWidth: 1.0, borderColor: UIColor.secondary3, cornerRadius: 5.0)
    }
}

