//
//  CustomHeaderFooterFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit

open class CustomHeaderFooterFormer<T: UITableViewHeaderFooterView> : BaseHeaderFooterFormer<T> {

    required public init(viewSetup: ((T) -> Void)? = nil) {
            super.init(viewSetup: viewSetup)
    }
}
