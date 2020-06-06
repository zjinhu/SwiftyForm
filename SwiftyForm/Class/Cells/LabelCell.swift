//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class LabelRow: LabelRowFormer<LabelCell> {

}

public class LabelCell: BaseCell, LabelFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var subTextLabel: UILabel!
    public private(set) weak var leftImageView: UIImageView!
    
    public func formLeftImageView() -> UIImageView? {
        return leftImageView
    }
    
    public func formTextLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formSubTextLabel() -> UILabel? {
        return subTextLabel
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
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let subTextLabel = UILabel()
        subTextLabel.textColor = .lightGray
        subTextLabel.textAlignment = .right
        contentView.addSubview(subTextLabel)
        self.subTextLabel = subTextLabel
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        subTextLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right)
            make.right.equalToSuperview().offset(-15)
        }
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

        subTextLabel.snp.updateConstraints { (make) in
            make.right.equalToSuperview().offset((accessoryType == .none) ? -15 : -5)
        }
    }
}
