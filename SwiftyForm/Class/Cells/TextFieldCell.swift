//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class TextFieldRow: TextFieldRowFormer<TextFieldCell> {

}

public class TextFieldCell: BaseCell, TextFieldFormableRow {

    public private(set) weak var textField: UITextField!
    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var leftImageView: UIImageView!
    
    public func formLeftImageView() -> UIImageView? {
        return leftImageView
    }
    
    public func formTextField() -> UITextField {
        return textField
    }
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        
        titleLabel.snp.remakeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            if leftImageView.image == nil{
                make.left.equalToSuperview().offset(15)
            }else{
                make.left.equalTo(leftImageView.snp.right).offset(5)
            }
        }

        
        textField.snp.updateConstraints { (make) in
            if titleLabel.text?.isEmpty == true{
                make.left.equalToSuperview().offset(15)
            }else{
                make.left.equalTo(titleLabel.snp.right)
            }
        }
    }
    
    public override func setup() {
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
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        self.titleLabel = titleLabel
        
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.textAlignment = .right
        contentView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right)
            make.right.equalToSuperview().offset(-15)
        }
        self.textField = textField
    }
}
