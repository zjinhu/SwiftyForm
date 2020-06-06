//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class CheckRow: CheckRowFormer<CheckCell> {

}

public class CheckCell: BaseCell, CheckFormableRow {

    public private(set) weak var leftImageView: UIImageView!
    public private(set) weak var titleLabel: UILabel!

    public func formLeftImageView() -> UIImageView? {
        return leftImageView
    }
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
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
    }

}
