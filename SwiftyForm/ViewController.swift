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
        check.title = "asdfas"
        check.titleImage = UIImage.init(named: "Image")
        check.checkColor = .orange
        check.cell.addDownLine()
        
        let avatarRow = AvatarRow()
        avatarRow.title = "头像"
        avatarRow.avatarImage = UIImage.init(named: "icon")
        avatarRow.cell.accessoryType = .disclosureIndicator
        avatarRow.cell.addDownLine()
        avatarRow.onSelected { (row) in
            print("dianjile")
        }
        
        let labelRow = LabelRow()
        labelRow.title = "asdfas"
        labelRow.subTitle = "qwqweqwe"
        labelRow.cell.accessoryType = .disclosureIndicator
        labelRow.cell.addDownLine()
        labelRow.onSelected { (row) in
            print("点击了啊啊啊")
        }
        
        let textFieldRow = TextFieldRow()
        textFieldRow.cell.addDownLine()
        textFieldRow.text = "123123"
        textFieldRow.title = "hahaha"
        textFieldRow.placeholder = "12414124124"
        textFieldRow.onTextChanged { (str) in
            print("\(str)")
        }
        
        let textViewRow = TextViewRow()
        textViewRow.title = "12312"
        textViewRow.placeholder = "asdasdasd"
        textViewRow.cell.addDownLine()
        
        let switchRow = SwitchRow()
        switchRow.title = "Switch"
        switchRow.switchWhenSelected = true
        switchRow.cell.addDownLine()
        
        let segmentRow = SegmentedRow()
        segmentRow.title = "Switch"
        segmentRow.segmentTitles = ["Opt1", "Opt2", "Opt3"]
        segmentRow.selectedIndex = UISegmentedControl.noSegment
        segmentRow.cell.addDownLine()
        
        let sectionFormer1 = SectionFormer(avatarRow, check,labelRow,textFieldRow,textViewRow,switchRow,segmentRow)
        let header = LabelHeader()
        header.title = "123"
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
        inlinePickerRow.title = "InlinePicker"
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
        inlineDateRow.title = "InlineDatePicker"
        inlineDateRow.cell.addDownLine()
        
        let btnRow = ButtonRow()
        btnRow.cell.leftButton.isHidden = true
        btnRow.cell.rightButton.backgroundColor = .orange
        btnRow.cell.addDownLine()
        let btn2Row = ButtonRow()
        btn2Row.cell.leftButton.backgroundColor = .blue
        btn2Row.cell.rightButton.backgroundColor = .orange
        btn2Row.cell.addDownLine()
        btn2Row.onLeftButtonClick {
            print("点击了111")
        }
        btn2Row.onRightButtonClick {
            print("点击了222")
        }
        
        let imgRow = ImageRow()
        imgRow.cell.addDownLine()
        imgRow.title = "asdfas"
        imgRow.subTitle = "qwqweqwe"
        imgRow.titleImage = UIImage.init(named: "Image")
        imgRow.onSelected { (row) in
            print("点击imgRow")
        }
        
        let sectionFormer3 = SectionFormer(inlinePickerRow,inlineDateRow,btnRow,btn2Row,imgRow)
        
        former.append(sectionFormer: sectionFormer1,sectionFormer3,sectionFormer2)
    }
    
    
}

