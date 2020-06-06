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
        check.configure { (row) in
            row.title = "asdfas"
            row.leftImage = UIImage.init(named: "Image")
            row.checkColor = .orange
        }
        
        let avatarRow = AvatarRow()
        avatarRow.configure { (row) in
            row.title = "头像"
            row.avatarImage = UIImage.init(named: "icon")
            row.cell.accessoryType = .disclosureIndicator
        }
        avatarRow.onSelected { (row) in
            print("dianjile")
        }
        
        let labelRow = LabelRow()
        labelRow.configure { (row) in
            row.title = "asdfas"
            row.subText = "qwqweqwe"
            row.cell.accessoryType = .disclosureIndicator
        }
        labelRow.onSelected { (row) in
            print("点击了啊啊啊")
        }
        
        let textFieldRow = TextFieldRow()

        textFieldRow.configure { (row) in
            row.text = "123123"
//            row.title = "hahaha"
            row.placeholder = "12414124124"
            
        }
        textFieldRow.onTextChanged { (str) in
            print("\(str)")
        }
        
        let textViewRow = TextViewRow()
        textViewRow.configure { (row) in
            row.title = "12312"
            row.placeholder = "asdasdasd"
        }
        
        let switchRow = SwitchRow()
        switchRow.configure { (row) in
            row.title = "Switch"
            row.switchWhenSelected = true
        }

        
        let segmentRow = SegmentedRow()
        segmentRow.configure(handler: { (row) in
            row.title = "Switch"
            row.segmentTitles = ["Opt1", "Opt2", "Opt3"]
            row.selectedIndex = UISegmentedControl.noSegment
        })
        
        let sectionFormer1 = SectionFormer(avatarRow, check,labelRow,textFieldRow,textViewRow,switchRow,segmentRow)
        let header = LabelHeader()
        header.text = "123"
        header.leftImage = UIImage.init(named: "Image")
        
        sectionFormer1.set(headerViewFormer: header)
        
        let datePickerRow = DatePickerRow()
        
        let pickerRow = PickerRow()
        pickerRow.configure { (row) in
            row.pickerItems = (1...20).map { PickerItem(title: "Option\($0)") }
        }
        
        let sectionFormer2 = SectionFormer(datePickerRow,pickerRow)
        
        let inlinePickerRow = InlinePickerRow()
        inlinePickerRow.configure { (row) in
            row.cell.accessoryType = .disclosureIndicator
            row.title = "InlinePicker"
            row.pickerItems = [InlinePickerItem(
                 title: "",
                 displayTitle: NSAttributedString(string: "Not set"),
                 value: nil)]
                 + (1...20).map { InlinePickerItem(title: "Option\($0)") }
        }
        
        let inlineDateRow = InlineDatePickerRow()
        inlineDateRow.configure { (row) in
            row.cell.accessoryType = .disclosureIndicator
            row.title = "InlineDatePicker"
        }
        
        let sectionFormer3 = SectionFormer(inlinePickerRow,inlineDateRow)
        
        former.append(sectionFormer: sectionFormer1,sectionFormer3,sectionFormer2)
    }


}

