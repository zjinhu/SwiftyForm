//
//  ButtonRowFormer.swift
//  SwiftyForm
//
//  Created by 张金虎 on 2020/6/6.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol ButtonFormableRow: FormableRow {
    func formLeftButton() -> UIButton?
    func formRightButton() -> UIButton?
}

open class ButtonRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: ButtonFormableRow {

    private final var onLeftButtonClick: (() -> Void)?
    private final var onRightButtonClick: (() -> Void)?
    
    @discardableResult
    public final func onLeftButtonClick(_ handler: @escaping (() -> Void)) -> Self {
        onLeftButtonClick = handler
        return self
    }
    
    @discardableResult
    public final func onRightButtonClick(_ handler: @escaping (() -> Void)) -> Self {
        onRightButtonClick = handler
        return self
    }
    
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }
    
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        cell.formLeftButton()?.addTarget(self, action: #selector(ButtonRowFormer.leftButtonAction(_:)), for: .touchUpInside)
        cell.formRightButton()?.addTarget(self, action: #selector(ButtonRowFormer.rightButtonAction(_:)), for: .touchUpInside)
    }
    
    open override func update() {
        super.update()
        cell.selectionStyle = .none
        let leftButton = cell.formLeftButton()
        let rightButton = cell.formRightButton()
        leftButton?.isEnabled = enabled
        rightButton?.isEnabled = enabled
    }
    
    @objc private dynamic func leftButtonAction(_ sender: UIButton) {
        onLeftButtonClick?()
    }
    
    @objc private dynamic func rightButtonAction(_ sender: UIButton) {
        onRightButtonClick?()
    }
}

