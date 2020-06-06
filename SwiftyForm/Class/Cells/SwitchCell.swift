//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class SwitchRow: SwitchRowFormer<SwitchCell> {

}

public class SwitchCell: BaseCell, SwitchFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var switchButton: UISwitch!
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formSwitch() -> UISwitch {
        return switchButton
    }
    
    public override func setup() {
        super.setup()
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let switchButton = UISwitch()
        contentView.addSubview(switchButton)
        self.switchButton = switchButton

        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        switchButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
    }
}
