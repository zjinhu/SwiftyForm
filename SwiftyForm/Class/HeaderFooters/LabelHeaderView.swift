//
//  FormLabelHeaderView.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class LabelHeader: LabelHeaderFooterFormer<LabelHeaderView> {

}

open class LabelHeaderView: BaseHeaderFooterView, LabelFormableView {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var leftImageView: UIImageView!
    
    public func formTitleLabel() -> UILabel {
        return titleLabel
    }
    
    public func formLeftImageView() -> UIImageView? {
        return leftImageView
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
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.insertSubview(titleLabel, at: 0)
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        self.titleLabel = titleLabel
    }
    
    open override func updateHeaderFooterFormer(_ headerFooterFormer: ViewFormer) {
        super.updateHeaderFooterFormer(headerFooterFormer)

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
