//
//  BaseHeaderFooterFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

open class BaseHeaderFooterFormer<T: UITableViewHeaderFooterView> : ViewFormer, ConfigurableForm {

    public var headerFooter: T {
        return viewInstance as! T
    }
    
    public init() {
        super.init(withViewType: T.self)
    }
    
    public final func viewUpdate(update: ((T) -> Void)) -> Self {
        update(headerFooter)
        return self
    }
    
    open func viewInitialized(_ view: T) {}
    
    override func viewInstanceInitialized(_ view: UITableViewHeaderFooterView) {
        viewInitialized(view as! T)
    }
}
