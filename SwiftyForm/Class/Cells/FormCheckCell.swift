//
//  FormCheckCell.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 7/26/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit

open class FormCheckCell: FormCell, CheckFormableRow {

    public private(set) weak var titleLabel: UILabel!

    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    open override func setup() {
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
