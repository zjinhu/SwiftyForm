//
//  ButtonRowFormer.swift
//  SwiftyForm
//
//  Created by 张金虎 on 2020/6/6.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

/// ButtonForm协议
public protocol ButtonFormableRow: FormableRow {
    func formLeftButton() -> UIButton?
    func formRightButton() -> UIButton?
}

/// ButtonForm 隐藏左侧按钮会只展示一个大按钮RightButton
open class ButtonRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: ButtonFormableRow {

    private final var onLeftButtonClick: (() -> Void)?
    private final var onRightButtonClick: (() -> Void)?
    
    
    /// 左侧按钮点击
    /// - Parameter handler: handler description
    /// - Returns: description
    @discardableResult public final func onLeftButtonClick(_ handler: @escaping (() -> Void)) -> Self {
        onLeftButtonClick = handler
        return self
    }
    
    /// 右侧按钮点击
    /// - Parameter handler: handler description
    /// - Returns: description
    @discardableResult public final func onRightButtonClick(_ handler: @escaping (() -> Void)) -> Self {
        onRightButtonClick = handler
        return self
    }
    
    
    /// 初始化
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }
    
    /// 初始化
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        cell.formLeftButton()?.addTarget(self, action: #selector(ButtonRowFormer.leftButtonAction(_:)), for: .touchUpInside)
        cell.formRightButton()?.addTarget(self, action: #selector(ButtonRowFormer.rightButtonAction(_:)), for: .touchUpInside)
    }
    
    
    /// 数据更新
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

