//
//  BudgetsTableViewCell.swift
//  FinancePlan
//
//  Created by Mobdev on 07-04-22.
//

import UIKit

struct Budget {
    let icon: String
    let title: String
    let remainingMoney: String
}

class BudgetsTableViewCell: UITableViewCell {
    
    var budget: Budget? {
        didSet { prepare() }
    }
    
    private let budgetIcon = UIImageView()
    private let budgetTitle = UILabel()
    private let budgetRemainingAmount = UILabel()
    
    private func prepare() {
        prepareViews()
        prepareStyles()
        prepareConstraints()
    }
    
    private func prepareViews() {
        contentView.addSubview(budgetIcon)
        contentView.addSubview(budgetTitle)
        contentView.addSubview(budgetRemainingAmount)
        
        budgetIcon.image = UIImage(named: budget?.icon ?? "")
        budgetTitle.text = budget?.title
        budgetRemainingAmount.text = budget?.remainingMoney
    }
    
    private func prepareStyles() {
        budgetTitle.font = UIFont.systemFont(ofSize: 20)
        budgetRemainingAmount.font = UIFont.systemFont(ofSize: 18)
        budgetRemainingAmount.textColor = .systemGreen
    }
    
    private func prepareConstraints() {
        budgetIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            budgetIcon.heightAnchor.constraint(equalToConstant: 50),
            budgetIcon.widthAnchor.constraint(equalToConstant: 50),
            budgetIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            budgetIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        budgetTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            budgetTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            budgetTitle.leadingAnchor.constraint(equalTo: budgetIcon.trailingAnchor, constant: 15),
        ])
        
        budgetRemainingAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            budgetRemainingAmount.topAnchor.constraint(equalTo: budgetTitle.bottomAnchor, constant: 2),
            budgetRemainingAmount.leadingAnchor.constraint(equalTo: budgetIcon.trailingAnchor, constant: 15),
        ])
    }
    
}
