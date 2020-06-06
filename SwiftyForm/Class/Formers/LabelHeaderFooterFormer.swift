//
//  LabelHeaderFooterFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol LabelFormableView: FormableHeaderFooter {
    
    func formTitleLabel() -> UILabel
}

public class LabelHeaderFooterFormer<T: UITableViewHeaderFooterView>: BaseHeaderFooterFormer<T> where T: LabelFormableView {

    public var text: String?

    public override func initialized() {
        super.initialized()
        viewHeight = 30
    }
    
    public override func update() {
        super.update()
        headerFooter.formTitleLabel().text = text
    }
}
