//
//  ImageCell.swift
//  SwiftyForm
//
//  Created by 张金虎 on 2020/6/6.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class ImageRow: ImageRowFormer<ImageCell> {

}

open class ImageCell: BaseCell, ImageFormableRow {
    
    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var subTextLabel: UILabel!
    public private(set) weak var titleImageView: UIImageView!
    public private(set) weak var coverImageView: UIImageView!
    
    public func formTitleImageView() -> UIImageView? {
        return titleImageView
    }
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formImageView() -> UIImageView? {
        return coverImageView
    }
    
    public func formSubTextLabel() -> UILabel? {
        return subTextLabel
    }
    
    open override func setup() {
        super.setup()
        
        let titleImageView = UIImageView()
        titleImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleImageView.clipsToBounds = true
        contentView.addSubview(titleImageView)
        self.titleImageView = titleImageView
        
        let titleLabel = UILabel()
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let subTextLabel = UILabel()
        subTextLabel.textColor = .lightGray
        subTextLabel.textAlignment = .right
        contentView.addSubview(subTextLabel)
        self.subTextLabel = subTextLabel
        
        let coverImageView = UIImageView()
        coverImageView.clipsToBounds = true
        coverImageView.layer.cornerRadius = 10
        coverImageView.backgroundColor = .lightGray
        contentView.addSubview(coverImageView)
        self.coverImageView = coverImageView
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(40)
        }
        
        titleImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.left.equalToSuperview().offset(15)
        }
        
        subTextLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.left.equalTo(titleLabel.snp.right)
            make.right.equalToSuperview().offset(-15)
        }
        
        coverImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(120)
        }
    }

    open override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        
        titleLabel.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(40)
            if titleImageView.image == nil{
                make.left.equalToSuperview().offset(15)
            }else{
                make.left.equalTo(titleImageView.snp.right).offset(5)
            }
        }
    }
}

