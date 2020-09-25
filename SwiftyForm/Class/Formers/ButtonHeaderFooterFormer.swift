//
//  ButtonHeaderFooterFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/9/25.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol ButtonFormableView: FormableHeaderFooter {
    func formButton() -> UIButton
}

open class ButtonHeaderFooterFormer<T: UITableViewHeaderFooterView>: BaseHeaderFooterFormer<T> where T: ButtonFormableView {

    fileprivate var buttonClick: (() -> Void)?

    /// 右侧按钮点击
    /// - Parameter handler: handler description
    /// - Returns: description
    @discardableResult public func onButtonClick(_ handler: @escaping (() -> Void)) -> Self {
        buttonClick = handler
        return self
    }
    
    @objc private dynamic func buttonAction(_ sender: UIButton) {
        buttonClick?()
    }

    open override func initialized() {
        viewHeight = 60
    }
    
    open override func viewInitialized(_ view: T) {
        headerFooter.formButton().addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }

}
