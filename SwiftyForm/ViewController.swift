//
//  ViewController.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import SwiftBrick

class ViewController: JHTableViewController {
    
    lazy var former = Former(tableView: self.tableView!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        let user2 = User2Row()
        user2.userName = "用户名"
        user2.avatarImage = UIImage.init(named: "icon")
        user2.userInfo = "用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介用户简介"
        user2.cell.accessoryType = .disclosureIndicator
        user2.cell.userInfoLabel.font = .systemFont(ofSize: 11)
        user2.cell.addDownLine()
        user2.onSelected { (row) in
            print("点击了User2的Cell")
        }
        
        //MARK: 点击选中样式cell
        let check = CheckRow()
        check.title = "选中"
        check.titleImage = UIImage.init(named: "Image")
        check.checkColor = .orange
        check.cell.addDownLine()
        check.onCheckChanged { (isCheck) in
            print("点击了check的Cell\(isCheck)")
        }
        
        //MARK: 横向头像样式cell
        let avatarRow = AvatarRow()
        avatarRow.title = "头像"
        avatarRow.avatarImage = UIImage.init(named: "icon")
        avatarRow.cell.accessoryType = .disclosureIndicator
        avatarRow.cell.addDownLine()
        avatarRow.onSelected { (row) in
            print("点击了头像的Cell")
        }
        
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
        //        textFieldRow.text = "阿尔萨大法官"
        textFieldRow.title = "输入框"
        textFieldRow.placeholder = "请输入"
        textFieldRow.onTextChanged { (str) in
            print("\(str)")
        }
        
        //MARK: 输入框样式cell
        let textViewRow = TextViewRow()
        //        textViewRow.titleImage = UIImage.init(named: "Image")
        //        textViewRow.title = "输入框"
        //        textViewRow.subTitle = "这里是TextView"
        
        textViewRow.placeholder = "请输入"
        textViewRow.cell.addDownLine()
        
        //MARK: Switch样式cell
        let switchRow = SwitchRow()
        switchRow.title = "选择"
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
        
        let sectionFormer1 = SectionFormer(user,
                                           user2,
                                           avatarRow,
                                           check,
                                           labelRow,
                                           textFieldRow,
                                           textViewRow,
                                           switchRow,
                                           segmentRow)
        //MARK: 添加header
        let header = LabelHeader()
        header.title = "header1"
        //        header.headerFooter.backColor = .red
        header.titleImage = UIImage.init(named: "Image")
        sectionFormer1.set(headerViewFormer: header)
        
        //MARK: 日期滚轮样式cell
        let datePickerRow = DatePickerRow()
        datePickerRow.cell.addDownLine()
        
        //MARK: 普通选择滚轮样式cell
        let pickerRow = PickerRow()
        pickerRow.pickerItems = (1...20).map { PickerItem(title: "Option\($0)") }
        pickerRow.cell.addDownLine()
        
        let sectionFormer2 = SectionFormer(datePickerRow,pickerRow)
        //MARK: 添加header
        let header2 = LabelHeader()
        header2.title = "header12"
        //        header.headerFooter.backColor = .red
        header2.titleImage = UIImage.init(named: "Image")
        sectionFormer2.set(headerViewFormer: header2)
        
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
        
        //MARK: 单个按钮样式cell
        let btnRow = ButtonRow()
        btnRow.rowHeight = 100
        btnRow.cell.leftButton.isHidden = true
        btnRow.cell.rightButton.backgroundColor = .orange
        btnRow.cell.addDownLine()
        btnRow.onRightButtonClick {
            print("点击了按钮")
        }
        
        //MARK: 两个按钮样式cell
        let btn2Row = ButtonRow()
        btn2Row.cell.leftButton.backgroundColor = .blue
        btn2Row.cell.rightButton.backgroundColor = .orange
        btn2Row.cell.addDownLine()
        btn2Row.onLeftButtonClick {
            print("点击了左侧按钮")
        }
        btn2Row.onRightButtonClick {
            print("点击了右侧按钮")
        }
        
        //MARK: 选择图片样式cell
        let imgRow = ImageRow()
        imgRow.cell.addDownLine()
        imgRow.title = "选择图片"
        imgRow.subTitle = "需要处理点击事件"
        imgRow.titleImage = UIImage.init(named: "Image")
        imgRow.onSelected { (row) in
            print("点击了选择图片")
        }
        
        let sectionFormer3 = SectionFormer(inlinePickerRow,
                                           inlineDateRow,
                                           btnRow,
                                           btn2Row,
                                           imgRow)
        //MARK: 添加header
        let header3 = LabelHeader()
        sectionFormer3.set(headerViewFormer: header3)
        
        former.append(sectionFormer:
                        sectionFormer1,
                        sectionFormer3,
                        sectionFormer2)
    }
    
    
}

