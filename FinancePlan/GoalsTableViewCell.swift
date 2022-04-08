//
//  GoalsTableViewCell.swift
//  FinancePlan
//
//  Created by Mobdev on 07-04-22.
//

import UIKit

struct Goal {
    let title: String
    let link: String
    let icon: String
    let iconDescription: String
    let secondIcon: String
    let currentMoney: String
    let totalMoney: String
    let remainingMoney: String
}

class GoalsTableViewCell: UITableViewCell {
    
    var goal: Goal? {
        didSet { prepare() }
    }
    
    private let goalsTitle = UILabel()
    private let goalsLink = UILabel()
    private let goalsCard = UIView()
    private let goalsIcon = UIImageView()
    private let goalsIconDescription = UILabel()
    private let goalsSecondIcon = UIImageView()
    private let goalsCurrentAmount = UILabel()
    private let goalsTotalAmount = UILabel()
    private let goalsRemainingAmount = UILabel()
    
    private func prepare() {
        prepareViews()
        prepareStyles()
        prepareConstraints()
    }
    
    private func prepareViews() {
        contentView.addSubview(goalsTitle)
        contentView.addSubview(goalsLink)
        contentView.addSubview(goalsCard)
        goalsCard.addSubview(goalsIcon)
        goalsCard.addSubview(goalsIconDescription)
        goalsCard.addSubview(goalsSecondIcon)
        goalsCard.addSubview(goalsCurrentAmount)
        goalsCard.addSubview(goalsTotalAmount)
        goalsCard.addSubview(goalsRemainingAmount)
        
        goalsTitle.text = goal?.title
        goalsLink.text = goal?.link
        goalsIcon.image = UIImage(named: goal?.icon ?? "")
        goalsIconDescription.text = goal?.iconDescription
        goalsSecondIcon.image = UIImage(named: goal?.secondIcon ?? "")
        goalsCurrentAmount.text = goal?.currentMoney
        goalsTotalAmount.text = goal?.totalMoney
        goalsRemainingAmount.text = goal?.remainingMoney
    }
    
    private func prepareStyles() {
        goalsTitle.font = UIFont.boldSystemFont(ofSize: 25)
        goalsLink.font = UIFont.systemFont(ofSize: 20)
        goalsLink.textColor = .blue
        goalsCard.backgroundColor = .purple
        goalsCard.layer.cornerRadius = 10
        goalsIconDescription.font = UIFont.systemFont(ofSize: 20)
        goalsIconDescription.textColor = .white
        goalsCurrentAmount.font = UIFont.boldSystemFont(ofSize: 30)
        goalsCurrentAmount.textColor = .white
        goalsTotalAmount.font = UIFont.systemFont(ofSize: 25)
        goalsTotalAmount.textColor = .white
        goalsRemainingAmount.font = UIFont.systemFont(ofSize: 25)
        goalsRemainingAmount.textColor = .white
    }
    
    private func prepareConstraints() {
        goalsTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            goalsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        goalsLink.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsLink.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            goalsLink.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
        
        goalsCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsCard.topAnchor.constraint(equalTo: goalsTitle.bottomAnchor, constant: 10),
            goalsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            goalsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            goalsCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
        goalsIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsIcon.heightAnchor.constraint(equalToConstant: 48),
            goalsIcon.widthAnchor.constraint(equalToConstant: 48),
            goalsIcon.topAnchor.constraint(equalTo: goalsCard.topAnchor, constant: 15),
            goalsIcon.leadingAnchor.constraint(equalTo: goalsCard.leadingAnchor, constant: 15),
        ])
        
        goalsIconDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsIconDescription.topAnchor.constraint(equalTo: goalsCard.topAnchor, constant: 30),
            goalsIconDescription.leadingAnchor.constraint(equalTo: goalsIcon.trailingAnchor, constant: 10),
        ])
        
        goalsSecondIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsSecondIcon.heightAnchor.constraint(equalToConstant: 38),
            goalsSecondIcon.widthAnchor.constraint(equalToConstant: 38),
            goalsSecondIcon.topAnchor.constraint(equalTo: goalsCard.topAnchor, constant: 15),
            goalsSecondIcon.trailingAnchor.constraint(equalTo: goalsCard.trailingAnchor, constant: -15),
        ])
        
        goalsCurrentAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsCurrentAmount.topAnchor.constraint(equalTo: goalsCard.centerYAnchor),
            goalsCurrentAmount.leadingAnchor.constraint(equalTo: goalsCard.leadingAnchor, constant: 15),
        ])
        
        goalsTotalAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsTotalAmount.topAnchor.constraint(equalTo: goalsCurrentAmount.bottomAnchor, constant: 5),
            goalsTotalAmount.leadingAnchor.constraint(equalTo: goalsCard.leadingAnchor, constant: 15),
        ])
        
        goalsRemainingAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goalsRemainingAmount.topAnchor.constraint(equalTo: goalsCurrentAmount.bottomAnchor, constant: 5),
            goalsRemainingAmount.trailingAnchor.constraint(equalTo: goalsCard.trailingAnchor, constant: -15),
        ])
    }
    
}
