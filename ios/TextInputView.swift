//
//  InputField.swift
//  react-native-input-kit
//
//  Created by Bhoma ram on 29/12/23.
//

import UIKit

class TextInputView : UITextField, UITextFieldDelegate {
    @objc var color: String = "" {
        didSet {
            self.backgroundColor = UIColor(hex: color);
        }
    }
    
    @objc var value: String = "" {
        didSet {
            self.text = value;
        }
    }
    
    @objc var onChangeText: RCTDirectEventBlock?
    @objc var onFocus: RCTBubblingEventBlock?
    @objc var onEndEditing: RCTBubblingEventBlock?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() -> Void {
        self.delegate = self
    }
}

extension TextInputView {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let focus = onFocus {
            focus([:])
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let end = onEndEditing {
            end([:]);
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let value = textField.text {
            if let onChangeText = self.onChangeText {
                onChangeText(["text": value]);
            }
        }
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
}
