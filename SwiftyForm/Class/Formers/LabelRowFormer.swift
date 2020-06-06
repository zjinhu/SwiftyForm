//
//  LabelFormableRow.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol LabelFormableRow: FormableRow {
    
    func formTextLabel() -> UILabel?
    func formSubTextLabel() -> UILabel?
}

open class LabelRowFormer<T: UITableViewCell> : BaseRowFormer<T>, Formable where T: LabelFormableRow {

    open var title: String?
    open var subText: String?
    open var textDisabledColor: UIColor? = .lightGray
    open var subTextDisabledColor: UIColor? = .lightGray
 
    private final var textColor: UIColor?
    private final var subTextColor: UIColor?
    
    open override func update() {
        super.update()
        
        let textLabel = cell.formTextLabel()
        let subTextLabel = cell.formSubTextLabel()
        textLabel?.text = title
        subTextLabel?.text = subText
        
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
