//
//  SignUpGenderViewController.swift
//  SeSACFriend
//
//  Created by Joonhwan Jeon on 2022/01/21.
//

import UIKit

class SignUpGenderViewController: BaseViewController {
    let mainView = SignUpEmailView()
    let viewModel = SignUpEmailViewModel()
    let validation = Validation()
        
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.inputTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
        mainView.submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
    }
    
    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        viewModel.email.value = textField.text ?? ""
        submitButtonActiveCheck()
    }
    
    @objc func submitButtonClicked(_ sender: Any) {
        if !validation.isValidEmail(email: viewModel.email.value) {
            self.toastMessage(message: "이메일 형식이 올바르지 않습니다.")
        } else {
            self.navigationController?.pushViewController(SignUpEmailViewController(), animated: true)
        }
    }
    
    func submitButtonActiveCheck() {
        if !validation.isValidEmail(email: viewModel.email.value) {
            mainView.submitButton.backgroundColor = .customGray7
        } else {
            mainView.submitButton.backgroundColor = .customGreen
        }
    }
}
