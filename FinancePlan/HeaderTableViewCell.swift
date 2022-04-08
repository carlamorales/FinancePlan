//
//  HeaderTableViewCell.swift
//  FinancePlan
//
//  Created by Mobdev on 07-04-22.
//

import UIKit

struct Header {
    let title: String
    let date: String
    let icon: String
}

class HeaderTableViewCell: UITableViewCell {
    
    var header: Header? {
        didSet { prepare() }
    }
    
    private let headerTitle = UILabel()
    private let headerDate = UILabel()
    private let headerIcon = UIImageView()
    
    private func prepare() {
        prepareViews()
        prepareStyles()
        prepareConstraints()
    }
    
    private func prepareViews() {
        contentView.addSubview(headerTitle)
        contentView.addSubview(headerDate)
        contentView.addSubview(headerIcon)
        
        headerTitle.text = header?.title
        headerDate.text = header?.date
        headerIcon.image = UIImage(named: header?.icon ?? "")
    }
    
    private func prepareStyles() {
        headerDate.font = UIFont.systemFont(ofSize: 15)
        headerTitle.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    private func prepareConstraints() {
        headerDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerTitle.topAnchor.constraint(equalTo: headerDate.bottomAnchor, constant: 10),
            headerTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        headerIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerIcon.heightAnchor.constraint(equalToConstant: 30),
            headerIcon.widthAnchor.constraint(equalToConstant: 35),
            headerIcon.topAnchor.constraint(equalTo: headerDate.bottomAnchor, constant: 10),
            headerIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
}
