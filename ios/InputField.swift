//
//  InputField.swift
//  react-native-input-kit
//
//  Created by Bhoma ram on 29/12/23.
//

import UIKit

class InputField: UITextField {
    @objc var onChangeText: RCTDirectEventBlock?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() -> Void {
//        self.addTarget(self, action: #selector(onChange), for: .editingChanged)
    }
    
//    @objc func onChange() {
//        if let onChangeText = onChangeText {
//            if let value = self.text {
//                onChangeText([text: value])
//            }
//        }
//    }
}
