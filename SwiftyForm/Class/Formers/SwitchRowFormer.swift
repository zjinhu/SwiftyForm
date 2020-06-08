//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

/// SwitchForm协议
public protocol SwitchFormableRow: FormableRow {
    func formTitleImageView() -> UIImageView?
    func formSwitch() -> UISwitch
    func formTitleLabel() -> UILabel?
}

/// SwitchForm
open class SwitchRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: SwitchFormableRow {

    open var title: String?
    open var titleImage: UIImage?
    open var switched = false
    open var switchWhenSelected = false
    open var titleDisabledColor: UIColor? = .lightGray
 
    private final var onSwitchChanged: ((Bool) -> Void)?
    private final var titleColor: UIColor?
    private final var selectionStyle: UITableViewCell.SelectionStyle?
    
    /// SwitchForm 状态变化
    /// - Parameter handler: handler description
    /// - Returns: description
    @discardableResult public final func onSwitchChanged(_ handler: @escaping ((Bool) -> Void)) -> Self {
        onSwitchChanged = handler
        return self
    }
    
    /// SwitchForm初始化
    /// - Parameter cell: cell description
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        cell.formSwitch().addTarget(self, action: #selector(SwitchRowFormer.switchChanged(_:)), for: .valueChanged)
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
    /// SwitchForm初始化
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }

    /// SwitchForm数据更新
    open override func update() {
        super.update()
        
        if !switchWhenSelected {
            if selectionStyle == nil { selectionStyle = cell.selectionStyle }
            cell.selectionStyle = .none
        } else {
            _ = selectionStyle.map { cell.selectionStyle = $0 }
            selectionStyle = nil
        }
        
        let titleLabel = cell.formTitleLabel()
        titleLabel?.text = title
        let switchButton = cell.formSwitch()
        switchButton.isOn = switched
        switchButton.isEnabled = enabled
        
        if enabled {
            _ = titleColor.map { titleLabel?.textColor = $0 }
            titleColor = nil
        } else {
            if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
            titleLabel?.textColor = titleDisabledColor
        }
    }
    
    /// SwitchForm cell被点击
    /// - Parameter indexPath: indexPath description
    open override func cellSelected(indexPath: IndexPath) {        
        former?.deselect(animated: true)
        if switchWhenSelected && enabled {
            let switchButton = cell.formSwitch()
            switchButton.setOn(!switchButton.isOn, animated: true)
            switchChanged(switchButton)
        }
    }
 
    @objc private dynamic func switchChanged(_ switchButton: UISwitch) {
        if self.enabled {
            let switched = switchButton.isOn
            self.switched = switched
            onSwitchChanged?(switched)
        }
    }
}
