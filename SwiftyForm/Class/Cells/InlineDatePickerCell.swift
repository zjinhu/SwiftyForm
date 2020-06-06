//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class InlineDatePickerRow: InlineDatePickerRowFormer<InlineDatePickerCell> {

}

public class InlineDatePickerCell: BaseCell, InlineDatePickerFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var displayLabel: UILabel!
    
    private weak var rightConst: NSLayoutConstraint!
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formDisplayLabel() -> UILabel? {
        return displayLabel
    }
    
    public override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        
        displayLabel.snp.updateConstraints { (make) in
            make.right.equalToSuperview().offset((accessoryType == .none) ? -15 : -5)
        }
    }
    
    public override func setup() {
        super.setup()
        
        let titleLabel = UILabel()
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let displayLabel = UILabel()
        displayLabel.textColor = .lightGray
        displayLabel.textAlignment = .right
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(displayLabel)
        self.displayLabel = displayLabel
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        displayLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right)
            make.right.equalToSuperview().offset(-15)
        }
    }
}
