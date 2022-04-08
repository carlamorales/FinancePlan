//
//  IncomesExpensesTableViewCell.swift
//  FinancePlan
//
//  Created by Mobdev on 07-04-22.
//

import UIKit

struct IncomeExpense {
    let incTag: String
    let incAmount: String
    let expTag: String
    let expAmount: String
}

class IncomesExpensesTableViewCell: UITableViewCell {
    
    var incomeExpense: IncomeExpense? {
        didSet { prepare() }
    }
    
    private let incomeView = UIView()
    private let expenseView = UIView()
    private let incomeTag = UILabel()
    private let incomeAmount = UILabel()
    private let expenseTag = UILabel()
    private let expenseAmount = UILabel()
    
    private func prepare() {
        prepareViews()
        prepareStyles()
        prepareConstraints()
    }
    
    private func prepareViews() {
        contentView.addSubview(incomeView)
        contentView.addSubview(expenseView)
        incomeView.addSubview(incomeTag)
        incomeView.addSubview(incomeAmount)
        expenseView.addSubview(expenseTag)
        expenseView.addSubview(expenseAmount)
        
        incomeTag.text = incomeExpense?.incTag
        incomeAmount.text = incomeExpense?.incAmount
        expenseTag.text = incomeExpense?.expTag
        expenseAmount.text = incomeExpense?.expAmount
    }
    
    private func prepareStyles() {
        incomeView.backgroundColor = .systemPink
        incomeView.layer.cornerRadius = 10
        expenseView.backgroundColor = .systemYellow
        expenseView.layer.cornerRadius = 10
        incomeTag.font = UIFont.systemFont(ofSize: 18)
        incomeAmount.font = UIFont.boldSystemFont(ofSize: 25)
        expenseTag.font = UIFont.systemFont(ofSize: 18)
        expenseAmount.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    private func prepareConstraints() {
        incomeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            incomeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            incomeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            incomeView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -7),
            incomeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
        expenseView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expenseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            expenseView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 7),
            expenseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            expenseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
        incomeTag.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            incomeTag.topAnchor.constraint(equalTo: incomeView.topAnchor, constant: 30),
            incomeTag.leadingAnchor.constraint(equalTo: incomeView.leadingAnchor, constant: 5),
        ])
        
        incomeAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            incomeAmount.leadingAnchor.constraint(equalTo: incomeView.leadingAnchor, constant: 5),
            incomeAmount.bottomAnchor.constraint(equalTo: incomeView.bottomAnchor, constant: -5),
        ])
        
        expenseTag.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expenseTag.topAnchor.constraint(equalTo: expenseView.topAnchor, constant: 30),
            expenseTag.leadingAnchor.constraint(equalTo: expenseView.leadingAnchor, constant: 5),
        ])
        
        expenseAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expenseAmount.leadingAnchor.constraint(equalTo: expenseView.leadingAnchor, constant: 5),
            expenseAmount.bottomAnchor.constraint(equalTo: expenseView.bottomAnchor, constant: -5),
        ])
    }
    
}
