//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit
/// UISegmentedControl选择cell 左侧titleImageView titleLabel 右侧segmentedControl
public class SegmentedRow: SegmentedRowFormer<SegmentedCell> {

}

open class SegmentedCell: BaseCell, SegmentedFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var segmentedControl: UISegmentedControl!
    public private(set) weak var titleImageView: UIImageView!
    /// 标题左侧图标(可修改属性)
    public func formTitleImageView() -> UIImageView? {
        return titleImageView
    }
    /// 标题Label(可修改属性)
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    ///获取UISegmentedControl(可修改属性)
    public func formSegmented() -> UISegmentedControl {
        return segmentedControl
    }
    
    open override func setup() {
        super.setup()
        
        let titleImageView = UIImageView()
        titleImageView.clipsToBounds = true
        titleImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleImageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        contentView.addSubview(titleImageView)
        self.titleImageView = titleImageView
        titleImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(segmentedControl)
        self.segmentedControl = segmentedControl
        
        titleLabel.snp.makeConstraints { (make) in
             make.top.bottom.equalToSuperview()
             make.left.equalToSuperview().offset(20)
         }
         
         segmentedControl.snp.makeConstraints { (make) in
             make.centerY.equalToSuperview()
             make.right.equalToSuperview().offset(-20)
         }
    }
    
    open override func updateWithRowFormer(_ rowFormer: RowFormer) {
        
        titleLabel.snp.remakeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            if rowFormer.titleImage == nil{
                make.left.equalToSuperview().offset(20)
            }else{
                make.left.equalTo(titleImageView.snp.right).offset(5)
            }
        }
    }
}
