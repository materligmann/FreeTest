//
//  DetailViewController.swift
//  FreeTest
//
//  Created by Mathias Erligmann on 11/03/2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var launch: Launch?
    
    private let iconImageView = UIImageView()
    private let detailTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureIconImageView()
        configureDetailTextView()
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureIconImageView() {
        if let largeUrl = launch?.links?.patch?.large, let url = URL(string: largeUrl) {
            iconImageView.sd_setImage(with: url, completed: nil)
        }
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconImageView)
        iconImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        iconImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        iconImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func configureDetailTextView() {
        detailTextView.text = launch?.details
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailTextView)
        detailTextView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 0).isActive = true
        detailTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        detailTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

}
