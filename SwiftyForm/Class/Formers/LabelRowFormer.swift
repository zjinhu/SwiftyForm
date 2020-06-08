//
//  LabelFormableRow.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

/// LabelForm 协议
public protocol LabelFormableRow: FormableRow {
    
    func formTitleLabel() -> UILabel?
    func formTitleImageView() -> UIImageView?
    func formSubTitleLabel() -> UILabel?
}

/// LabelForm
open class LabelRowFormer<T: UITableViewCell> : BaseRowFormer<T>, Formable where T: LabelFormableRow {

    open var title: String?
    open var titleImage: UIImage?
    open var subTitle: String?
    open var titleDisabledColor: UIColor? = .lightGray
    open var subTitleDisabledColor: UIColor? = .lightGray
 
    private final var titleColor: UIColor?
    private final var subTitleColor: UIColor?
    
    /// LabelForm初始化
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }
    
    /// LabelForm初始化
    /// - Parameter cell: cell 泛型
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
    /// LabelForm数据更新
    open override func update() {
        super.update()
        
        let textLabel = cell.formTitleLabel()
        let subTitleLabel = cell.formSubTitleLabel()
        textLabel?.text = title
        subTitleLabel?.text = subTitle
        
        if enabled {
            _ = titleColor.map { textLabel?.textColor = $0 }
            _ = subTitleColor.map { subTitleLabel?.textColor = $0 }
            titleColor = nil
            subTitleColor = nil
        } else {
            if titleColor == nil { titleColor = textLabel?.textColor ?? .black }
            if subTitleColor == nil { subTitleColor = subTitleLabel?.textColor ?? .black }
            textLabel?.textColor = titleDisabledColor
            subTitleLabel?.textColor = subTitleDisabledColor
        }
    }
}
