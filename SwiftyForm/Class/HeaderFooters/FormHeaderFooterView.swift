//
//  FormHeaderFooterView.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
open class FormHeaderFooterView: UITableViewHeaderFooterView, FormableHeaderFooter {
    open func updateHeaderFooterFormer(_ headerFooterFormer: ViewFormer) {
        
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    open func setup() {
        contentView.backgroundColor = .white
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
