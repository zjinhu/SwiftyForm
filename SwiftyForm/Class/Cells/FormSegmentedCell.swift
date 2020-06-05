//
//  FormSegmentedCell.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 7/30/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit

open class FormSegmentedCell: FormCell, SegmentedFormableRow {
    
    // MARK: Public
    
    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var segmentedControl: UISegmentedControl!
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formSegmented() -> UISegmentedControl {
        return segmentedControl
    }
    
    open override func setup() {
        super.setup()
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(segmentedControl)
        self.segmentedControl = segmentedControl
        
        titleLabel.snp.makeConstraints { (make) in
             make.top.bottom.equalToSuperview()
             make.left.equalToSuperview().offset(15)
         }
         
         segmentedControl.snp.makeConstraints { (make) in
             make.centerY.equalToSuperview()
             make.right.equalToSuperview().offset(-15)
         }
    }
}
