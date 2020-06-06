//
//  TextFieldRowFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol TextFieldFormableRow: FormableRow {
    
    func formTextField() -> UITextField
    func formTitleLabel() -> UILabel?
}

open class TextFieldRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: TextFieldFormableRow {

    override open var canBecomeEditing: Bool {
        return enabled
    }
    
    open var title: String?
    open var text: String?
    open var placeholder: String?
    open var attributedPlaceholder: NSAttributedString?
    open var textDisabledColor: UIColor? = .lightGray
    open var titleDisabledColor: UIColor? = .lightGray
    open var titleEditingColor: UIColor?
    open var returnToNextRow = true
    
    fileprivate final var onReturn: ((String) -> Void)?
    
    private final var onTextChanged: ((String) -> Void)?
    private final var textColor: UIColor?
    private final var titleColor: UIColor?
 
 private lazy var observer: Observer<T> = Observer<T>(textFieldRowFormer: self)
    @discardableResult
    public final func onTextChanged(_ handler: @escaping ((String) -> Void)) -> Self {
        onTextChanged = handler
        return self
    }

    @discardableResult
    public final func onReturn(_ handler: @escaping ((String) -> Void)) -> Self {
        onReturn = handler
        return self
    }
    
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        let textField = cell.formTextField()
        textField.delegate = observer
        let events: [(Selector, UIControl.Event)] = [(#selector(TextFieldRowFormer.textChanged(textField:)), .editingChanged),
            (#selector(TextFieldRowFormer.editingDidBegin(textField:)), .editingDidBegin),
            (#selector(TextFieldRowFormer.editingDidEnd(textField:)), .editingDidEnd)]
        events.forEach {
            textField.addTarget(self, action: $0.0, for: $0.1)
        }
    }
    
    open override func update() {
        super.update()
        
        cell.selectionStyle = .none
        let titleLabel = cell.formTitleLabel()
        let textField = cell.formTextField()
        titleLabel?.text = title
        textField.text = text
        _ = placeholder.map { textField.placeholder = $0 }
        _ = attributedPlaceholder.map { textField.attributedPlaceholder = $0 }
        textField.isUserInteractionEnabled = false
        
        if enabled {
            if isEditing {
                if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
                _ = titleEditingColor.map { titleLabel?.textColor = $0 }
            } else {
                _ = titleColor.map { titleLabel?.textColor = $0 }
                titleColor = nil
            }
            _ = textColor.map { textField.textColor = $0 }
            textColor = nil
        } else {
            if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
            if textColor == nil { textColor = textField.textColor ?? .black }
            titleLabel?.textColor = titleDisabledColor
            textField.textColor = textDisabledColor
        }
    }
    
    open override func cellSelected(indexPath: IndexPath) {
        let textField = cell.formTextField()
        if !textField.isEditing {
            textField.isUserInteractionEnabled = true
            textField.becomeFirstResponder()
        }
    }
    
    @objc private dynamic func textChanged(textField: UITextField) {
        if enabled {
            let text = textField.text ?? ""
            self.text = text
            onTextChanged?(text)
        }
    }
    
    @objc private dynamic func editingDidBegin(textField: UITextField) {
        let titleLabel = cell.formTitleLabel()
        if titleColor == nil { textColor = textField.textColor ?? .black }
        _ = titleEditingColor.map { titleLabel?.textColor = $0 }
    }
    
    @objc private dynamic func editingDidEnd(textField: UITextField) {
        let titleLabel = cell.formTitleLabel()
        if enabled {
            _ = titleColor.map { titleLabel?.textColor = $0 }
            titleColor = nil
        } else {
            if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
            _ = titleEditingColor.map { titleLabel?.textColor = $0 }
        }
        cell.formTextField().isUserInteractionEnabled = false
    }
}

private class Observer<T: UITableViewCell>: NSObject, UITextFieldDelegate where T: TextFieldFormableRow {
    
    fileprivate weak var textFieldRowFormer: TextFieldRowFormer<T>?
    
    init(textFieldRowFormer: TextFieldRowFormer<T>) {
        self.textFieldRowFormer = textFieldRowFormer
    }
    
    fileprivate dynamic func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textFieldRowFormer = textFieldRowFormer else { return false }
        if let returnHandler = textFieldRowFormer.onReturn {
            returnHandler(textField.text ?? "")
            return false
        }
        if textFieldRowFormer.returnToNextRow {
            let returnToNextRow = (textFieldRowFormer.former?.canBecomeEditingNext() ?? false) ?
                textFieldRowFormer.former?.becomeEditingNext :
                textFieldRowFormer.former?.endEditing
            _ = returnToNextRow?()
        }
        return !textFieldRowFormer.returnToNextRow
    }
}
