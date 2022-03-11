//
//  HabituesTableViewCell.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import UIKit
import SDWebImage

class LaunchTableViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let successLabel = UILabel()
    private let iconView = UIImageView()
    
    class var cellIdentifier: String {
        return "LaunchTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureIconView()
        configureNameLabel()
        configureAddressLabel()
        configureCityLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    
    private func configureIconView() {
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconView)
        iconView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    private func configureNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        nameLabel.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureAddressLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    private func configureCityLabel() {
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(successLabel)
        successLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8).isActive = true
        successLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        successLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        successLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    func set(launch: Launch?) {
        if let smallURL = launch?.links?.patch?.small, let url = URL(string: smallURL) {
            iconView.sd_setImage(with: url, completed: nil)
        }
        nameLabel.text = launch?.name
        dateLabel.text = launch?.date_utc
        if let success = launch?.success {
            successLabel.text = "\(success)"
        }
    }
}
