//
//  ViewController.swift
//  MemeGenerator
//
//  Created by Aizada on 21.09.2023.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private var memeTextField: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.placeholder = "Meme"
        text.font = UIFont.boldSystemFont(ofSize: 16)
        return text
    }()
    
    private var topTextField: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.placeholder = "Enter top text"
        text.font = UIFont.boldSystemFont(ofSize: 16)
        return text
    }()
    
    private var bottomTextField: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.placeholder = "Enter bottom text"
        text.font = UIFont.boldSystemFont(ofSize: 16)
        return text
    }()
    
    private var createMemeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("Create a meme", for: .normal)
        return button
    }()
    
    private var picture: UIImageView = {
        let picture = UIImageView()
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(memeTextField)
        view.addSubview(topTextField)
        view.addSubview(bottomTextField)
        view.addSubview(createMemeButton)
        view.addSubview(picture)
        setupConstraints()
        
        createMemeButton.addTarget(self, action: #selector(createMeme), for: .touchUpInside)
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        memeTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        topTextField.snp.makeConstraints { make in
            make.top.equalTo(memeTextField).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        bottomTextField.snp.makeConstraints { make in
            make.top.equalTo(topTextField).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        createMemeButton.snp.makeConstraints { make in
            make.top.equalTo(bottomTextField).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        picture.snp.makeConstraints { make in
            make.top.equalTo(createMemeButton).offset(50)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
            
        }
    }
    
    // MARK: - Actions
    
    @objc private func createMeme() {
        guard let memeText = memeTextField.text, !memeText.isEmpty,
            let topText = topTextField.text, !topText.isEmpty,
            let bottomText = bottomTextField.text, !bottomText.isEmpty,
            var components = URLComponents(string: "https://apimeme.com/meme") else {
                picture.image = nil
                return
        }
        
        // Добавляем параметры к URL
        components.queryItems = [
            URLQueryItem(name: "meme", value: memeText),
            URLQueryItem(name: "top", value: topText),
            URLQueryItem(name: "bottom", value: bottomText)
        ]
        
        // Создаем URL из компонентов
        guard let url = components.url else {
            picture.image = nil
            return
        }
        picture.kf.setImage(with: url)
    }
}
