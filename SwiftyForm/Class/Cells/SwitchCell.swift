//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class SwitchRow: SwitchRowFormer<SwitchCell> {

}

open class SwitchCell: BaseCell, SwitchFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var switchButton: UISwitch!
    public private(set) weak var leftImageView: UIImageView!
    
    public func formLeftImageView() -> UIImageView? {
        return leftImageView
    }
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formSwitch() -> UISwitch {
        return switchButton
    }
    
    open override func setup() {
        super.setup()
        
        let leftImageView = UIImageView()
        leftImageView.clipsToBounds = true
        contentView.addSubview(leftImageView)
        self.leftImageView = leftImageView
        leftImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let switchButton = UISwitch()
        contentView.addSubview(switchButton)
        self.switchButton = switchButton

        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        switchButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
    }
    
    open override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        
        titleLabel.snp.remakeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            if leftImageView.image == nil{
                make.left.equalToSuperview().offset(15)
            }else{
                make.left.equalTo(leftImageView.snp.right).offset(5)
            }
        }


    }
}
