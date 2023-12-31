@objc(InputKitViewManager)
class InputKitViewManager: RCTViewManager {
    
    override func view() -> (TextInputView) {
        return TextInputView();
    }
    
    @objc override static func requiresMainQueueSetup() -> Bool {
        return false
    }
}

class TextInputView : UITextField {
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() -> Void {
        self.addTarget(self, action: #selector(onChange), for: .editingChanged)
    }
    
    @objc func onChange() {
        if let onChangeText = onChangeText {
            if let value = self.text {
                onChangeText([text: value])
            }
        }
    }
}

class InputKitView : UIView {
    var input: InputField = {
        return InputField();
    }()
    
    @objc var color: String = "" {
        didSet {
            self.backgroundColor = UIColor(hex: color);
        }
    }
    
    @objc var value: String = "" {
        didSet {
            self.input.text = value;
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit();
    }
    
    func commonInit() -> Void {
        self.addSubview(input);
        input.translatesAutoresizingMaskIntoConstraints = false;
        input.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        input.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        input.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        input.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
        input.backgroundColor = UIColor.blue
    }
    
}

extension UIColor {
    static let offWhite = UIColor.init(red: 225/255, green: 225/255, blue: 235/255, alpha: 1)
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
