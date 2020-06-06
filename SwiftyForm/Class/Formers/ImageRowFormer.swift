//
//  ImageRowFormer.swift
//  SwiftyForm
//
//  Created by 张金虎 on 2020/6/6.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol ImageFormableRow: FormableRow {
    func formTitleImageView() -> UIImageView?
    func formTitleLabel() -> UILabel?
    func formSubTextLabel() -> UILabel?
    func formImageView() -> UIImageView?
}

open class ImageRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: ImageFormableRow {
 
    open var title: String?
    open var titleImage: UIImage?
    open var subText: String?
    open var coverImage: UIImage?
    open var textDisabledColor: UIColor? = .lightGray
    open var subTextDisabledColor: UIColor? = .lightGray
 
    private final var textColor: UIColor?
    private final var subTextColor: UIColor?
 
    open override func initialized() {
        super.initialized()
        rowHeight = 170
    }
    
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
    open override func update() {
        super.update()
        
        cell.selectionStyle = .none

        let textLabel = cell.formTitleLabel()
        let subTextLabel = cell.formSubTextLabel()
        textLabel?.text = title
        subTextLabel?.text = subText
        
        let coverImageView = cell.formImageView()
        coverImageView?.image = coverImage
        
        if enabled {
            _ = textColor.map { textLabel?.textColor = $0 }
            _ = subTextColor.map { subTextLabel?.textColor = $0 }
            textColor = nil
            subTextColor = nil
        } else {
            if textColor == nil { textColor = textLabel?.textColor ?? .black }
            if subTextColor == nil { subTextColor = subTextLabel?.textColor ?? .black }
            textLabel?.textColor = textDisabledColor
            subTextLabel?.textColor = subTextDisabledColor
        }
        
    }
}
