//
//  FormAvatarCell.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit

open class FormAvatarCell: FormCell, AvatarFormableRow {
    
    // MARK: Public
    
    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var avatarView: UIImageView!
    
    public func formTextLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formAvatarView() -> UIImageView? {
        return avatarView
    }
    
    open override func setup() {
        super.setup()
        
        let titleLabel = UILabel()
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let avatarView = UIImageView()
        avatarView.layer.cornerRadius = 25
        avatarView.clipsToBounds = true
        avatarView.backgroundColor = .lightGray
        contentView.addSubview(avatarView)
        self.avatarView = avatarView
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        avatarView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
            make.height.width.equalTo(50)
        }
    }

    open override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)

    }
}
