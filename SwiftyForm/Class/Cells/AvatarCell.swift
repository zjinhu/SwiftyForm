//
//  FormAvatarCell.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class AvatarRow: AvatarRowFormer<AvatarCell> {

}

public class AvatarCell: BaseCell, AvatarFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var avatarView: UIImageView!
    
    public func formTextLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formAvatarView() -> UIImageView? {
        return avatarView
    }
    
    public override func setup() {
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

    public override func updateWithRowFormer(_ rowFormer: RowFormer) {
        super.updateWithRowFormer(rowFormer)
        avatarView.snp.updateConstraints { (make) in
            make.right.equalToSuperview().offset((accessoryType == .none) ? -15 : -5)
        }
    }
}
