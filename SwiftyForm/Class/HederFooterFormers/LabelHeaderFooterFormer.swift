//
//  LabelHeaderFooterFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit

public protocol LabelFormableView: FormableHeaderFooter {
    
    func formTitleLabel() -> UILabel
}

public final class LabelHeaderFooterFormer<T: UITableViewHeaderFooterView>: BaseHeaderFooterFormer<T> where T: LabelFormableView {

    public var text: String?
    
    required public init(viewSetup: ((T) -> Void)? = nil) {
        super.init(viewSetup: viewSetup)
    }
    
    public override func initialized() {
        super.initialized()
        viewHeight = 30
    }
    
    public override func update() {
        super.update()
        headerFooter.formTitleLabel().text = text
    }
}
