//
//  ImageRowFormer.swift
//  SwiftyForm
//
//  Created by 张金虎 on 2020/6/6.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

/// ImageForm协议
public protocol ImageFormableRow: FormableRow {
    func formTitleImageView() -> UIImageView?
    func formTitleLabel() -> UILabel?
    func formSubTitleLabel() -> UILabel?
    func formImageView() -> UIImageView?
}

/// ImageForm 顶部和LabelRorm一样,下边是图片
open class ImageRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: ImageFormableRow {

    open var subTitle: String?
    open var coverImage: UIImage?
    open var subTitleDisabledColor: UIColor? = .lightGray
    private final var subTitleColor: UIColor?
 
    open override func initialized() {
        rowHeight = 190
    }
    
    open override func cellInitialized(_ cell: T) {
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
    open override func update() {
        super.update()
        
        cell.selectionStyle = .none

        let titleLabel = cell.formTitleLabel()
        let subTitleLabel = cell.formSubTitleLabel()
        titleLabel?.text = title
        subTitleLabel?.text = subTitle
        
        let coverImageView = cell.formImageView()
        coverImageView?.image = coverImage
        
        if enabled {
            _ = titleColor.map { titleLabel?.textColor = $0 }
            _ = subTitleColor.map { subTitleLabel?.textColor = $0 }
            titleColor = nil
            subTitleColor = nil
        } else {
            if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
            if subTitleColor == nil { subTitleColor = subTitleLabel?.textColor ?? .black }
            titleLabel?.textColor = titleDisabledColor
            subTitleLabel?.textColor = subTitleDisabledColor
        }
        
    }
}
