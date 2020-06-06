//
//  AvatarRowFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol AvatarFormableRow: FormableRow {
    
    func formTitleLabel() -> UILabel?
    func formTitleImageView() -> UIImageView?
    func formAvatarView() -> UIImageView?
}

open class AvatarRowFormer<T: UITableViewCell> : BaseRowFormer<T>, Formable where T: AvatarFormableRow {
 
    open var title: String?
    open var titleImage: UIImage?
    open var avatarImage: UIImage?
    open var titleDisabledColor: UIColor? = .lightGray
    
    private final var textColor: UIColor?
    
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }
    
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
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
