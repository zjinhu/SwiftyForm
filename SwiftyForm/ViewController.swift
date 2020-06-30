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
        
        let check = CheckRow()
        check.title = "选中"
        check.titleImage = UIImage.init(named: "Image")
        check.checkColor = .orange
        check.cell.addDownLine()
        
        let avatarRow = AvatarRow()
        avatarRow.title = "头像"
        avatarRow.avatarImage = UIImage.init(named: "icon")
        avatarRow.cell.accessoryType = .disclosureIndicator
        avatarRow.cell.addDownLine()
        avatarRow.onSelected { (row) in
            print("点击了头像的Cell")
        }
        
        let labelRow = LabelRow()
        labelRow.title = "文本"
        labelRow.subTitle = "qwqweqwe"
        labelRow.cell.accessoryType = .disclosureIndicator
        labelRow.cell.addDownLine()
        labelRow.onSelected { (row) in
            print("点击了文本的Cell")
        }
        
        let textFieldRow = TextFieldRow()
        textFieldRow.titleImage = UIImage.init(named: "Image")
        textFieldRow.cell.addDownLine()
//        textFieldRow.text = "阿尔萨大法官"
        textFieldRow.title = "输入框"
        textFieldRow.placeholder = "请输入"
        textFieldRow.onTextChanged { (str) in
            print("\(str)")
        }
        
        let textViewRow = TextViewRow()
//        textViewRow.titleImage = UIImage.init(named: "Image")
        textViewRow.title = "输入框"
        textViewRow.subTitle = "这里是TextView"
        
        textViewRow.placeholder = "请输入"
        textViewRow.cell.addDownLine()
        
        let switchRow = SwitchRow()
        switchRow.title = "选择"
        switchRow.switchWhenSelected = true
        switchRow.cell.addDownLine()
        
        let segmentRow = SegmentedRow()
        segmentRow.title = "选择"
        segmentRow.segmentTitles = ["路飞", "索隆", "乔巴"]
        segmentRow.selectedIndex = UISegmentedControl.noSegment
        segmentRow.cell.addDownLine()
        
        let sectionFormer1 = SectionFormer(avatarRow, check,labelRow,textFieldRow,textViewRow,switchRow,segmentRow)
        let header = LabelHeader()
        header.title = "header"
//        header.headerFooter.backColor = .red
        header.titleImage = UIImage.init(named: "Image")
        
        sectionFormer1.set(headerViewFormer: header)
        
        let datePickerRow = DatePickerRow()
        datePickerRow.cell.addDownLine()
        
        let pickerRow = PickerRow()
        pickerRow.pickerItems = (1...20).map { PickerItem(title: "Option\($0)") }
        pickerRow.cell.addDownLine()
        
        let sectionFormer2 = SectionFormer(datePickerRow,pickerRow)
        
        let inlinePickerRow = InlinePickerRow()
        inlinePickerRow.cell.accessoryType = .disclosureIndicator
        inlinePickerRow.title = "内嵌picker"
        inlinePickerRow.cell.addDownLine()
        inlinePickerRow.pickerItems = [InlinePickerItem(
            title: "",
            displayTitle: NSAttributedString(string: "Not set"),
            value: nil)]
            + (1...20).map { InlinePickerItem(title: "Option\($0)") }
        
        let inlineDateRow = InlineDatePickerRow()
//        inlineDateRow.inlineCellUpdate { (picker) in
//            picker.datePicker.locale = Locale.init(identifier: "zh")
//            picker.datePicker.datePickerMode = .date
//            picker.datePicker.timeZone = TimeZone.init(identifier: "GMT")
//        }
        inlineDateRow.cell.accessoryType = .disclosureIndicator
        inlineDateRow.title = "内嵌日期"
        inlineDateRow.cell.addDownLine()
        
        let btnRow = ButtonRow()
        btnRow.cell.leftButton.isHidden = true
        btnRow.cell.rightButton.backgroundColor = .orange
        btnRow.cell.addDownLine()
        btnRow.onRightButtonClick {
            print("点击了按钮")
        }
        
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
        
        let imgRow = ImageRow()
        imgRow.cell.addDownLine()
        imgRow.title = "选择图片"
        imgRow.subTitle = "需要处理点击事件"
        imgRow.titleImage = UIImage.init(named: "Image")
        imgRow.onSelected { (row) in
            print("点击了选择图片")
        }
        
        let sectionFormer3 = SectionFormer(inlinePickerRow,inlineDateRow,btnRow,btn2Row,imgRow)
        
        former.append(sectionFormer: sectionFormer1,sectionFormer3,sectionFormer2)
    }
    
    
}

