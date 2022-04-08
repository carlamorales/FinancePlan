//
//  ViewController.swift
//  FinancePlan
//
//  Created by Mobdev on 07-04-22.
//

import UIKit

class ViewController: UIViewController {
    
    let mainTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainTable)
        mainTable.pin(to: view)
        
        mainTable.register(HeaderTableViewCell.self, forCellReuseIdentifier: "headerCell")
        mainTable.register(IncomesExpensesTableViewCell.self, forCellReuseIdentifier: "incExpCell")
        mainTable.register(GoalsTableViewCell.self, forCellReuseIdentifier: "goalsCell")
        mainTable.register(BudgetsTableViewCell.self, forCellReuseIdentifier: "budgetsCell")
        
        mainTable.dataSource = self
        mainTable.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case .zero:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
            headerCell.header = Header(title: "Finance Plan", date: "Jueves 7 de abril, 2022", icon: "headerIcon")
            return headerCell
        case 1:
            let incExpCell = tableView.dequeueReusableCell(withIdentifier: "incExpCell") as! IncomesExpensesTableViewCell
            incExpCell.incomeExpense = IncomeExpense(incTag: "Incomes", incAmount: "$5 978.22", expTag: "Expenses", expAmount: "$4 553.12")
            return incExpCell
        case 2:
            let goalsCell = tableView.dequeueReusableCell(withIdentifier: "goalsCell") as! GoalsTableViewCell
            goalsCell.goal = Goal(title: "Goals", link: "Show all", icon: "goalsIcon1", iconDescription: "Trip to Japan", secondIcon: "goalsIcon2", currentMoney: "$890.22", totalMoney: "Of $1 900.00", remainingMoney: "$ 1 009.8 left")
            return goalsCell
        case 3:
            let budget = Budget(icon: "budgetsIcon1", title: "Food & Drink", remainingMoney: "$890.00 Left")
            return prepareBudgetCell(tableView, budget: budget)
        case 4:
            let budget = Budget(icon: "budgetsIcon2", title: "Travel", remainingMoney: "$360.00 Left")
            return prepareBudgetCell(tableView, budget: budget)
        default:
            return UITableViewCell()
        }
    }
    
    private func prepareBudgetCell(_ tableView: UITableView, budget: Budget) -> BudgetsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetsCell") as! BudgetsTableViewCell
        cell.budget = budget
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 120
        case 2:
            return 300
        default:
            return 80
        }
    }
}
