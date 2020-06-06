//
//  ButtonCell.swift
//  SwiftyForm
//
//  Created by 张金虎 on 2020/6/6.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class ButtonRow: ButtonRowFormer<ButtonCell> {

}

open class ButtonCell: BaseCell, ButtonFormableRow {
    
    public private(set) weak var leftButton: UIButton!
    public private(set) weak var rightButton: UIButton!
    
    public func formLeftButton() -> UIButton? {
        return leftButton
    }
    
    public func formRightButton() -> UIButton? {
        return rightButton
    }
 
    open override func setup() {
        super.setup()
        
        let leftButton = UIButton()
        contentView.addSubview(leftButton)
        self.leftButton = leftButton
        leftButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(contentView.snp.centerX).offset(-5)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        let rightButton = UIButton()
        contentView.addSubview(rightButton)
        self.rightButton = rightButton
        rightButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.left.equalTo(contentView.snp.centerX).offset(5)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    open override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        
        rightButton.snp.remakeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            if leftButton.isHidden{
                make.left.equalToSuperview().offset(20)
            }else{
                make.left.equalTo(contentView.snp.centerX).offset(5)
            }
        }
    }
}
