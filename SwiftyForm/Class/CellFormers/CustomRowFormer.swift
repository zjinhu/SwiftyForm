//
//  CustomRowFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit

public final class CustomRowFormer<T: UITableViewCell>: BaseRowFormer<T>, Formable {
    
    public required init(cellSetup: ((T) -> Void)? = nil) {
        super.init(cellSetup: cellSetup)
    }
}
