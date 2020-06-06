//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class TextViewRow: TextViewRowFormer<TextViewCell> {

}

public class TextViewCell: BaseCell, TextViewFormableRow {

    public private(set) weak var textView: UITextView!
    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var leftImageView: UIImageView!
    
    public func formLeftImageView() -> UIImageView? {
        return leftImageView
    }
    
    public func formTextView() -> UITextView {
        return textView
    }
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        
        titleLabel.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
            if leftImageView.image == nil{
                make.left.equalToSuperview().offset(15)
            }else{
                make.left.equalTo(leftImageView.snp.right).offset(5)
            }
        }

        textView.snp.updateConstraints { (make) in
            if titleLabel.text?.isEmpty == true{
                make.top.equalToSuperview()
            }else{
                make.top.equalTo(titleLabel.snp.bottom)
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
        self.titleLabel = titleLabel
        
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 17)
        textView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textView)
        self.textView = textView

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
    }

}
