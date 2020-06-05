//
//  HeaderFooterFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit

public protocol FormableHeaderFooter{
    
    func updateHeaderFooterFormer(_ headerFooterFormer: ViewFormer)
}

open class ViewFormer {
    
    open var viewHeight: CGFloat = 0.0001
    
    internal func viewInstanceInitialized(_ view: UITableViewHeaderFooterView) {
        
    }
    
    // MARK: Private
    private var _viewInstance: UITableViewHeaderFooterView?
    private final let viewType: UITableViewHeaderFooterView.Type
    private final let viewSetup: ((UITableViewHeaderFooterView) -> Void)
    
    public init<T: UITableViewHeaderFooterView>(withViewType type: T.Type, withViewSetup setup: ((T) -> Void)? = nil) {
            viewType = type
            viewSetup = { setup?(($0 as! T)) }
            initialized()
    }
    
    @discardableResult
    public func dynamicViewHeight(_ handler: @escaping ((UITableView, /*section:*/Int) -> CGFloat)) -> Self {
        dynamicViewHeight = handler
        return self
    }
    
    open func initialized() {
        
    }
    
    public func update() {
        if let formableView = viewInstance as? FormableHeaderFooter {
            formableView.updateHeaderFooterFormer(self)
        }
    }
    
    // MARK: Internal
    
    internal final var dynamicViewHeight: ((UITableView, Int) -> CGFloat)?
    
    internal final var viewInstance: UITableViewHeaderFooterView {
        if _viewInstance == nil {
            _viewInstance = viewType.init(reuseIdentifier: nil)
            viewInstanceInitialized(_viewInstance!)
            viewSetup(_viewInstance!)
        }
        return _viewInstance!
    }
}
