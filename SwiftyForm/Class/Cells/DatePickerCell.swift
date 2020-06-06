//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class DatePickerRow: DatePickerRowFormer<DatePickerCell> {

}

open class DatePickerCell: BaseCell, DatePickerFormableRow {

    public private(set) weak var datePicker: UIDatePicker!
    
    public func formDatePicker() -> UIDatePicker {
        return datePicker
    }
    
    open override func setup() {
        super.setup()
        
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(datePicker)
        self.datePicker = datePicker
        datePicker.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
