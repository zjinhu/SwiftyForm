//
//  ViewController.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//
import UIKit
import SwiftBrick
import SwiftyAttributes
class ViewController: JHTableViewController {
    
    lazy var former = Former(tableView: self.tableView!)
    
    lazy var s1 : SectionFormer = {
        
        //MARK: 用户头像样式cell
        let user = UserRow()
        user.userName = "用户名"
        user.avatarImage = UIImage.init(named: "icon")
        user.userInfo = "用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介"
        user.cell.userInfoLabel.font = .systemFont(ofSize: 11)
        user.cell.addDownLine()
        user.onSelected { (row) in
            print("点击了User的Cell")
        }
        
        let section = SectionFormer(user)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "用户简介样式, 上中下: 头像 名字 简介"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s2 : SectionFormer = {
        
        //MARK: 用户头像样式cell
        let user = User2Row()
        user.userName = "用户名"
        user.avatarImage = UIImage.init(named: "icon")
        user.userInfo = "用户简介用户简介用户简介用户简介用户简介用户简介用户用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介"
        user.cell.accessoryType = .disclosureIndicator
        user.cell.userInfoLabel.font = .systemFont(ofSize: 11)
        user.cell.addDownLine()
        user.onSelected { (row) in
            print("点击了User2的Cell")
        }
        
        let section = SectionFormer(user)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "用户简介样式, 左-上下: 头像 名字 简介"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s3 : SectionFormer = {
        
        //MARK: 横向头像样式cell
        let avatarRow = AvatarRow()
        avatarRow.title = "头像"
        avatarRow.avatarRadius = 25
        avatarRow.avatarImage = UIImage.init(named: "icon")
        avatarRow.cell.accessoryType = .disclosureIndicator
        avatarRow.cell.addDownLine()
        avatarRow.onSelected { (row) in
            print("点击了头像的Cell")
        }
        
        let section = SectionFormer(avatarRow)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "头像样式, 左-右: 名字 头像 "
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s4 : SectionFormer = {
        
        //MARK: 点击选中样式cell
        let check = CheckRow()
        check.title = "选中"
        check.titleImage = UIImage.init(named: "Image")
        check.checkColor = .orange
        check.cell.addDownLine()
        check.onCheckChanged { (isCheck) in
            print("点击了check的Cell\(isCheck)")
        }
        
        let section = SectionFormer(check)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "选中样式"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s5 : SectionFormer = {
        
        //MARK: 纯文本样式cell
        let labelRow = LabelRow()
        labelRow.title = "文本"
        labelRow.subTitle = "qwqweqwe"
        labelRow.cell.accessoryType = .disclosureIndicator
        labelRow.cell.addDownLine()
        labelRow.onSelected { (row) in
            print("点击了文本的Cell")
            
        }
        
        //MARK: 输入框样式cell
        let textFieldRow = TextFieldRow()
        textFieldRow.titleImage = UIImage.init(named: "Image")
        textFieldRow.cell.addDownLine()
        textFieldRow.textLimit = 10
        //        textFieldRow.text = "阿尔萨大法官"
        textFieldRow.title = "输入框"
        textFieldRow.placeholder = "请输入"
        textFieldRow.onTextChanged { (str) in
            print("\(str)")
        }
        textFieldRow.onLimitAlert { limit in
            print("字数限制\(limit)")
        }
        
        //MARK: 输入框样式cell
        let textViewRow = TextViewRow()
        textViewRow.rowHeight = 160
//        textViewRow.titleImage = UIImage.init(named: "Image")
        textViewRow.attributedTitle = "输入框".withFont(Font15) + "滑块".withFont(Font11).withTextColor(.green)
        textViewRow.subTitle = "这里是TextView"
        textViewRow.textLimit = 10
        textViewRow.placeholder = "请输入"
        textViewRow.cell.formTextView().backgroundColor = .baseBackground
//        textViewRow.text = "asefraefraefasfa"
        textViewRow.cell.addDownLine()
        textViewRow.onLimitAlert { limit in
            print("字数限制\(limit)")
        }
        
        let section = SectionFormer(labelRow, textFieldRow, textViewRow)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "文本样式"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s6 : SectionFormer = {
        
        //MARK: Switch样式cell
        let switchRow = SwitchRow()
//        switchRow.enabled = false
        switchRow.attributedTitle = "选择".withFont(Font15) + "滑块".withFont(Font11).withTextColor(.green)
        switchRow.switchWhenSelected = true
        switchRow.cell.addDownLine()
        switchRow.onSwitchChanged { (isOpen) in
            print("点击了开关的Cell\(isOpen)")
        }
        
        
        //MARK: Segmented样式cell
        let segmentRow = SegmentedRow()
        segmentRow.title = "选择"
        segmentRow.segmentTitles = ["路飞", "索隆", "乔巴"]
        segmentRow.selectedIndex = UISegmentedControl.noSegment
        segmentRow.cell.addDownLine()
        segmentRow.onSegmentSelected { (index, title) in
            print("点击了选项卡的Cell的第\(index)个\(title)")
        }
        
        let section = SectionFormer(switchRow, segmentRow)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "选择样式"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s7 : SectionFormer = {
        
        //MARK: 日期滚轮样式cell
        let datePickerRow = DatePickerRow()
        datePickerRow.cell.addDownLine()
        
        //MARK: 内嵌日期滚轮样式cell
        let inlineDateRow = InlineDatePickerRow()
        //        inlineDateRow.inlineCellUpdate { (picker) in
        //            picker.datePicker.locale = Locale.init(identifier: "zh")
        //            picker.datePicker.datePickerMode = .date
        //            picker.datePicker.timeZone = TimeZone.init(identifier: "GMT")
        //        }
        inlineDateRow.cell.accessoryType = .disclosureIndicator
        inlineDateRow.title = "内嵌日期"
        inlineDateRow.cell.addDownLine()
        
        let section = SectionFormer(datePickerRow, inlineDateRow)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "日期样式"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s8 : SectionFormer = {
        
        //MARK: 普通选择滚轮样式cell
        let pickerRow = PickerRow()
        pickerRow.pickerItems = (1...20).map { PickerItem(title: "Option\($0)") }
        
        //MARK: 内嵌滚轮样式cell
        let inlinePickerRow = InlinePickerRow()
        inlinePickerRow.cell.accessoryType = .disclosureIndicator
        inlinePickerRow.title = "内嵌picker"
        inlinePickerRow.cell.addDownLine()
        inlinePickerRow.pickerItems = [InlinePickerItem(
            title: "",
            displayTitle: NSAttributedString(string: "Not set"),
            value: nil)]
            + (1...20).map { InlinePickerItem(title: "Option\($0)") }
        
        let section = SectionFormer(pickerRow, inlinePickerRow)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "滚轮样式"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s9: SectionFormer = {
        
        //MARK: 单个按钮样式cell
        let btnRow = ButtonRow()
        btnRow.rowHeight = 100
        btnRow.cell.leftButton.isHidden = true
        btnRow.rightButtonBGColor = .orange
        btnRow.cell.addDownLine()
        btnRow.onRightButtonClick {
            print("点击了按钮")

        }
        
        //MARK: 两个按钮样式cell
        let btn2Row = ButtonRow()
        btn2Row.leftButtonBGColor = .blue
        btn2Row.rightButtonBGColor = .orange
        btn2Row.cell.addDownLine()
        btn2Row.onLeftButtonClick {
            print("点击了左侧按钮")
//            sectionFormer1.remove(rowFormer: user)
//            self.former.reload(sectionFormer: sectionFormer1)
        }
        btn2Row.onRightButtonClick {
            print("点击了右侧按钮")
//            sectionFormer1.insert(rowFormer: user, toIndex: 0)
//            self.former.reload(sectionFormer: sectionFormer1)
        }
        
        let section = SectionFormer(btnRow, btn2Row)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "按钮样式"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        return section
    }()
    
    lazy var s10: SectionFormer = {
        
        //MARK: 选择图片样式cell
        let imgRow = ImageRow()
        imgRow.cell.addDownLine()
        imgRow.title = "选择图片"
        imgRow.subTitle = "需要处理点击事件"
        imgRow.titleImage = UIImage.init(named: "Image")
        imgRow.onSelected { (row) in
            print("点击了选择图片")
        }
        
        let section = SectionFormer(imgRow)
        
        let header = LabelHeaderFooter()
        header.viewHeight = 20
        header.title = "图片样式"
        header.headerFooter.backColor = .baseTeal
        section.set(headerViewFormer: header)
        
        let footer = ButtonFooter()
        footer.viewHeight = 100
        footer.headerFooter.backColor = .baseBackground
        footer.buttonBGColor = .red
        footer.buttonTitle = "这是footer"

        section.set(footerViewFormer: footer)
        footer.onButtonClick {//[weak self] in
//            guard let `self` = self else{return}
            print("dianji")
        }
        
        return section
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        former.append(sectionFormer:
                        s1,
                        s2,
                        s3,
                        s4,
                        s5,
                        s6,
                        s7,
                        s8,
                        s9,
                        s10)
        
        
    }
    
    
}

