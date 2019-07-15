//
//  SignInViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/07/15.
//  Copyright © 2019 吉川椛. All rights reserved.
//

//import UIKit
//import Firebase
//class SignInViewController: UIViewController {
//
//    private func showErrorIfNeeded(_ errorOrNil: Error?) {
//        // エラーがなければ何もしません
//        guard let error = errorOrNil else { return }
//
//        let message = errorMessage(of: error) // エラーメッセージを取得
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
//
//    private func errorMessage(of error: Error) -> String {
//        var message = "エラーが発生しました"
//        guard let errcd = AuthErrorCode(rawValue: (error as NSError).code) else {
//            return message
//        }
//
//        switch errcd {
//        case .networkError: message = "ネットワークに接続できません"
//        case .userNotFound: message = "ユーザが見つかりません"
//        case .invalidEmail: message = "不正なメールアドレスです"
//        case .emailAlreadyInUse: message = "このメールアドレスは既に使われています"
//        case .wrongPassword: message = "入力した認証情報でサインインできません"
//        case .userDisabled: message = "このアカウントは無効です"
//        case .weakPassword: message = "パスワードが脆弱すぎます"
//        // これは一例です。必要に応じて増減させてください
//        default: break
//        }
//        return message
//    }
//
//    @IBOutlet private weak var emailTextField: UITextField!
//    @IBOutlet private weak var passwordTextField: UITextField!
//
//    //signIn
//    @IBAction private func didTapSignInButton() {
//        let email =  emailTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
//
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
//            guard let self = self else { return }
//            if let user = result?.user {
//                // サインイン後の画面へ
//            }
//            self.showErrorIfNeeded(error)
//        }
//    }
//    
    //forget password
//    @IBAction private func didTapSendButton() {
//        let email = emailTextField.text ?? ""
//
//        Auth.auth().sendPasswordReset(withEmail: email) { [ weak self ] error in
//            guard let self = self else { return }
//            if error != nil{
//                //送信完了画面へ
//            }
//            self.showErrorIfNeeded(error)
//
//        }
//    }
    //forget password
    
    //signOut
//    @IBAction private func didTapSignOutButton() {
//        do {
//            try Auth.auth().signOut()
//        } catch let  error {
//            showErrorIfNeeded(error)
//        }
//    }
    
//    //退会
//    @IBAction private func didTapWithDrawButton() {
//        Auth.auth().currentUser?.delete() { [ weak self] error in
//            guard let self = self else { return }
//            if error != nil {
//                //非ログイン画面へ
//            }
//            self.showErrorIfNeeded(error)
//        }
//    }
//    //退会
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
