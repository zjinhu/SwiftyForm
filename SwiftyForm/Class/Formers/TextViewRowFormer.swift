//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit
import SnapKit

/// TextViewForm 协议
public protocol TextViewFormableRow: FormableRow {
    func formTitleImageView() -> UIImageView?
    func formTitleLabel() -> UILabel?
    func formTextView() -> UITextView
}

/// TextViewForm
open class TextViewRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: TextViewFormableRow {

    override open var canBecomeEditing: Bool {
        return enabled
    }
    open var title: String?
    open var titleImage: UIImage?
    open var text: String?
    open var placeholder: String?
    open var attributedPlaceholder: NSAttributedString?
    open var textDisabledColor: UIColor? = .lightGray
    open var titleDisabledColor: UIColor? = .lightGray
    open var titleEditingColor: UIColor?
 
    fileprivate final var onTextChanged: ((String) -> Void)?
    fileprivate final var textColor: UIColor?
    fileprivate final var titleColor: UIColor?
    fileprivate final var _attributedString: NSAttributedString?
    fileprivate final weak var placeholderLabel: UILabel?
    fileprivate final lazy var observer: Observer<T> = Observer<T>(textViewRowFormer: self)
    
    deinit {
        cell.formTextView().delegate = nil
    }
    
    /// TextViewForm 输入变化
    /// - Parameter handler: handler description
    /// - Returns: description
    @discardableResult public final func onTextChanged(_ handler: @escaping ((String) -> Void)) -> Self {
        onTextChanged = handler
        return self
    }
    
    /// TextViewForm 初始化
    open override func initialized() {
        super.initialized()
        rowHeight = 170
    }
    
    /// TextViewForm 初始化
    open override func cellInitialized(_ cell: T) {
        cell.formTextView().delegate = observer
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
    /// TextViewForm数据更新
    open override func update() {
        super.update()
        
        cell.selectionStyle = .none
        let textView = cell.formTextView()
        let titleLabel = cell.formTitleLabel()
        titleLabel?.text = title
        textView.text = text
        textView.isUserInteractionEnabled = false
        
        if placeholderLabel == nil {
            let placeholderLabel = UILabel()
            placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
            textView.addSubview(placeholderLabel)
            self.placeholderLabel = placeholderLabel
            placeholderLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(6)
                make.left.equalToSuperview().offset(5)
            }
        }
        _ = placeholder.map { placeholderLabel?.text  = $0 }
        if let attributedPlaceholder = attributedPlaceholder {
            placeholderLabel?.text = nil
            placeholderLabel?.attributedText = attributedPlaceholder
        }
        updatePlaceholderColor(text: textView.text)
        
        if enabled {
            if isEditing {
                if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
                _ = titleEditingColor.map { titleLabel?.textColor = $0 }
            } else {
                _ = titleColor.map { titleLabel?.textColor = $0 }
                titleColor = nil
            }
            _ = textColor.map { textView.textColor = $0 }
            textColor = nil
        } else {
            if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
            if textColor == nil { textColor = textView.textColor ?? .black }
            titleLabel?.textColor = titleDisabledColor
            textView.textColor = textDisabledColor
        }
    }
    
    /// TextViewForm cell被点击
    /// - Parameter indexPath: indexPath description
    open override func cellSelected(indexPath: IndexPath) {
        let textView = cell.formTextView()
        textView.becomeFirstResponder()
        textView.isUserInteractionEnabled = enabled
    }

    fileprivate final func updatePlaceholderColor(text: String?) {
        if attributedPlaceholder == nil {
            placeholderLabel?.textColor = (text?.isEmpty ?? true) ?
                UIColor(red: 0, green: 0, blue: 0.098 / 255, alpha: 0.22) :
                .clear
        } else {
            if text?.isEmpty ?? true {
                _ = _attributedString.map { placeholderLabel?.attributedText = $0 }
                _attributedString = nil
            } else {
                if _attributedString == nil { _attributedString = placeholderLabel?.attributedText }
                placeholderLabel?.attributedText = nil
            }
        }
    }
}

private class Observer<T: UITableViewCell>:NSObject, UITextViewDelegate where T: TextViewFormableRow {
    
    fileprivate weak var textViewRowFormer: TextViewRowFormer<T>?
    
    init(textViewRowFormer: TextViewRowFormer<T>) {
        self.textViewRowFormer = textViewRowFormer
    }
    
    fileprivate dynamic func textViewDidChange(_ textView: UITextView) {
        guard let textViewRowFormer = textViewRowFormer else { return }
        if textViewRowFormer.enabled {
            let text = textView.text ?? ""
            textViewRowFormer.text = text
            textViewRowFormer.onTextChanged?(text)
            textViewRowFormer.updatePlaceholderColor(text: text)
        }
    }
    
    fileprivate dynamic func textViewDidBeginEditing(_ textView: UITextView) {
        guard let textViewRowFormer = textViewRowFormer else { return }
        if textViewRowFormer.enabled {
            let titleLabel = textViewRowFormer.cell.formTitleLabel()
            if textViewRowFormer.titleColor == nil {
                textViewRowFormer.titleColor = titleLabel?.textColor ?? .black
            }
            _ = textViewRowFormer.titleEditingColor.map { titleLabel?.textColor = $0 }
            textViewRowFormer.isEditing = true
        }
    }
    
    fileprivate dynamic func textViewDidEndEditing(_ textView: UITextView) {
        guard let textViewRowFormer = textViewRowFormer else { return }
        let titleLabel = textViewRowFormer.cell.formTitleLabel()
        textViewRowFormer.cell.formTextView().isUserInteractionEnabled = false
        
        if textViewRowFormer.enabled {
            _ = textViewRowFormer.titleColor.map { titleLabel?.textColor = $0 }
            textViewRowFormer.titleColor = nil
        } else {
            if textViewRowFormer.titleColor == nil {
                textViewRowFormer.titleColor = titleLabel?.textColor ?? .black
            }
            titleLabel?.textColor = textViewRowFormer.titleDisabledColor
        }
        textViewRowFormer.isEditing = false
    }
}
