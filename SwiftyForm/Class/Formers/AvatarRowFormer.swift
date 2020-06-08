//
//  AvatarRowFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

/// AvatarForm协议
public protocol AvatarFormableRow: FormableRow {
    
    func formTitleLabel() -> UILabel?
    func formTitleImageView() -> UIImageView?
    func formAvatarView() -> UIImageView?
}

/// AvatarForm
open class AvatarRowFormer<T: UITableViewCell> : BaseRowFormer<T>, Formable where T: AvatarFormableRow {
 
    open var title: String?
    open var titleImage: UIImage?
    open var avatarImage: UIImage?
    open var titleDisabledColor: UIColor? = .lightGray
    
    private final var textColor: UIColor?
    
    /// AvatarForm初始化
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }
    /// AvatarForm初始化
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
    /// AvatarForm数据更新
    open override func update() {
        super.update()
        
        let textLabel = cell.formTitleLabel()
        let avatarView = cell.formAvatarView()
        textLabel?.text = title
        avatarView?.image = avatarImage
        
        if enabled {
            _ = textColor.map { textLabel?.textColor = $0 }
            textColor = nil
        } else {
            if textColor == nil { textColor = textLabel?.textColor ?? .black }
            textLabel?.textColor = titleDisabledColor
        }
    }
}
