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

    public private(set) weak var titleLabel: UILabel!

    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public override func setup() {
        super.setup()
        
        let titleLabel = UILabel()        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.insertSubview(titleLabel, at: 0)
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        self.titleLabel = titleLabel

    }
}
