//
//  LabelHeaderFooterFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol LabelFormableView: FormableHeaderFooter {
    func formTitleImageView() -> UIImageView?
    func formTitleLabel() -> UILabel
}

open class LabelHeaderFooterFormer<T: UITableViewHeaderFooterView>: BaseHeaderFooterFormer<T> where T: LabelFormableView {

    open var title: String?
    open var titleImage: UIImage?

    open override func initialized() {
        super.initialized()
        viewHeight = 30
    }
    
    open override func viewInitialized(_ view: T) {
        super.viewInitialized(view)
        headerFooter.formTitleImageView()?.image = titleImage
    }
    open override func update() {
        super.update() 
        headerFooter.formTitleLabel().text = title
    }
}
