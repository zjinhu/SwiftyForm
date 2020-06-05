//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit

open class BaseRowFormer<T: UITableViewCell>: RowFormer {

    public var cell: T {
        return cellInstance as! T
    }
    
    required public init(cellSetup: ((T) -> Void)? = nil) {
        super.init(withCellType: T.self, withCellSetup: cellSetup)
    }

    @discardableResult
    public final func cellSetup(_ handler: @escaping ((T) -> Void)) -> Self {
        cellSetup = { handler(($0 as! T)) }
        return self
    }
    
    @discardableResult
    public final func cellUpdate(_ update: ((T) -> Void)) -> Self {
        update(cell)
        return self
    }
    
    open func cellInitialized(_ cell: T) {}

    override func cellInstanceInitialized(_ cell: UITableViewCell) {
        cellInitialized(cell as! T)
    }
}
