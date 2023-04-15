//
//  UnderlinedTextField.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/15.
//

import UIKit
import SwiftUI

struct UnderlinedTextField: UIViewRepresentable {
    var placeholder: String
    var icon: String
    var isSecure: Bool
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> CustomTextField {
        let textField = CustomTextField()
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecure
        textField.borderStyle = .none
        textField.delegate = context.coordinator
        textField.autocapitalizationType = .none

        let imageView = UIImageView(image: UIImage(systemName: icon))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray.withAlphaComponent(0.5)
        textField.leftView = imageView
        textField.leftViewMode = .always

        return textField
    }

    func updateUIView(_ uiView: CustomTextField, context: Context) {
        uiView.text = text
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var underlinedTextField: UnderlinedTextField

        init(_ underlinedTextField: UnderlinedTextField) {
            self.underlinedTextField = underlinedTextField
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            underlinedTextField.text = textField.text ?? ""
        }
    }
}


// MARK: CustomTextField
class CustomTextField: UITextField {
    private var underlineLayer: CALayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUnderline()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUnderline()
    }

    private func setupUnderline() {
        let underline = CALayer()
        underline.backgroundColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        underlineLayer = underline
        layer.addSublayer(underline)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        underlineLayer?.frame = CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1)
    }
}
