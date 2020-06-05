//
//  ViewController.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import SwiftBrick

class ViewController: JHTableViewController {
    
    public private(set) lazy var former: Former = Former(tableView: self.tableView!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let check = CheckRowFormer<FormCheckCell>()
        check.configure { (cell) in
            cell.title = "asdfas"
            cell.checkColor = .orange
        }
        
        let avatarRow = AvatarRowFormer<FormAvatarCell>()
        avatarRow.configure { (cell) in
            cell.title = "头像"
            cell.avatarImage = UIImage.init(named: "icon")
        }
        avatarRow.onSelected { (cell) in
            print("dianjile")
        }
        
        let labelRow = LabelRowFormer<FormLabelCell>()
        labelRow.configure { (cell) in
            cell.title = "asdfas"
            cell.subText = "qwqweqwe"
        }
        labelRow.onSelected { (cell) in
            print("点击了啊啊啊")
        }
        
        
        let textFieldRow = TextFieldRowFormer<FormTextFieldCell>()

        textFieldRow.configure { (cell) in
            cell.text = "123123"
//            cell.title = "hahaha"
            cell.placeholder = "12414124124"
        }
        textFieldRow.onTextChanged { (str) in
            print("\(str)")
        }
        
        let textViewRow = TextViewRowFormer<FormTextViewCell>()
        textViewRow.configure { (cell) in
            cell.title = "12312"
            cell.placeholder = "asdasdasd"
        }
        let switchRow = SwitchRowFormer<FormSwitchCell>()
        switchRow.configure { (cell) in
            cell.title = "Switch"
        }
        
        let segmentRow = SegmentedRowFormer<FormSegmentedCell>()
        segmentRow.configure(handler: { (cell) in
            cell.title = "Switch"
            cell.segmentTitles = ["Opt1", "Opt2", "Opt3"]
            cell.selectedIndex = UISegmentedControl.noSegment
        })

        let sectionFormer1 = SectionFormer(rowFormer: avatarRow, check,labelRow,textFieldRow,textViewRow,switchRow,segmentRow)
        let header = LabelHeaderFooterFormer<FormLabelHeaderView>()
        header.text = "123"
        sectionFormer1.set(headerViewFormer: header)
        
        let datePickerRow = DatePickerRowFormer<FormDatePickerCell>()
        let pickerRow = PickerRowFormer<FormPickerCell, Any>()
        pickerRow.configure { (cell) in
            cell.pickerItems = (1...20).map { PickerItem(title: "Option\($0)") }
        }
        let sectionFormer2 = SectionFormer(rowFormer: datePickerRow,pickerRow)
        
        let inlinePickerRow = InlinePickerRowFormer<FormInlinePickerCell, Any>()
        inlinePickerRow.configure { (cell) in
            cell.title = "InlinePicker"
            cell.pickerItems = [InlinePickerItem(
                 title: "",
                 displayTitle: NSAttributedString(string: "Not set"),
                 value: nil)]
                 + (1...20).map { InlinePickerItem(title: "Option\($0)") }
        }
        let inlineDateRow = InlineDatePickerRowFormer<FormInlineDatePickerCell>()
        inlineDateRow.configure { (cell) in
            cell.title = "InlineDatePicker"
        }
        let sectionFormer3 = SectionFormer(rowFormer: inlinePickerRow,inlineDateRow)
        former.append(sectionFormer: sectionFormer1,sectionFormer3,sectionFormer2)
    }


}

