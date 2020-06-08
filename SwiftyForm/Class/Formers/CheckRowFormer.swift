//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol CheckFormableRow: FormableRow {
    func formTitleLabel() -> UILabel?
    func formTitleImageView() -> UIImageView?
}


open class CheckRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable where T: CheckFormableRow {
    
    open var title: String?
    open var titleImage: UIImage?
    open var checked = false
    open var customCheckView: UIView?
    open var titleDisabledColor: UIColor? = .lightGray
    
    open var checkColor: UIColor?
 
    private final var titleColor: UIColor?
    private final var onCheckChanged: ((Bool) -> Void)?
    
    @discardableResult
    public final func onCheckChanged(_ handler: @escaping ((Bool) -> Void)) -> Self {
        onCheckChanged = handler
        return self
    }
    
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        let titleImageView = cell.formTitleImageView()
        titleImageView?.image = titleImage
    }
    
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }
    
    open override func update() {
        super.update()
        if let customCheckView = customCheckView {
            cell.accessoryView = customCheckView
            customCheckView.isHidden = checked ? false : true
        } else {
            cell.accessoryType = checked ? .checkmark : .none
        }
        
        let titleLabel = cell.formTitleLabel()
        titleLabel?.text = title
        
        if enabled {
            _ = titleColor.map { titleLabel?.textColor = $0 }
            titleColor = nil
        } else {
            if titleColor == nil { titleColor = titleLabel?.textColor ?? .black }
            titleLabel?.textColor = titleDisabledColor
        }
        
        if let color = checkColor {
            cell.tintColor = color
        }
    }
    
    open override func cellSelected(indexPath: IndexPath) {
        former?.deselect(animated: true)
        if enabled {
            checked = !checked
            onCheckChanged?(checked)
            if let customCheckView = customCheckView {
                cell.accessoryView = customCheckView
                customCheckView.isHidden = checked ? false : true
            } else {
                cell.accessoryType = checked ? .checkmark : .none
            }
        }
    }
}
