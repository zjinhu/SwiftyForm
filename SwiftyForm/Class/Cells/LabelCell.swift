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
    
    public func formTextLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formSubTextLabel() -> UILabel? {
        return subTextLabel
    }
    
    public override func setup() {
        super.setup()
        
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

    }
}
