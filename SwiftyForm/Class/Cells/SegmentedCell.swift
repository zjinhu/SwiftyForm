//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class SegmentedRow: SegmentedRowFormer<SegmentedCell> {

}

public class SegmentedCell: BaseCell, SegmentedFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var segmentedControl: UISegmentedControl!
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formSegmented() -> UISegmentedControl {
        return segmentedControl
    }
    
    public override func setup() {
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
