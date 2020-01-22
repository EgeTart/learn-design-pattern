//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/14.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: - Properties
    private let questionGroupCareTaker = QuestionGroupCareTaker()
    private var questionGroups: [QuestionGroup] {
        return questionGroupCareTaker.questionGroups
    }
    
    private var selectedQuestionGroup: QuestionGroup! {
        get { return questionGroupCareTaker.selectedQuestionGroup }
        set { questionGroupCareTaker.selectedQuestionGroup = newValue }
    }
    private let appSettings = AppSettings.shared
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        questionGroups.forEach { (questionGroup) in
            print("\(questionGroup.title) : correctCount \(questionGroup.score.correctCount), incorrectCount \(questionGroup.score.incorrectCount)")
        }
    }
    
}

// MARK: - UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell", for: indexPath) as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        
        cell.percentageSubscriber = questionGroup.score.$runningPercentage.receive(on: DispatchQueue.main).map({ (value) -> String in
            return String(format: "%.0f %%", round(100 * value))
        }).assign(to: \.text, on: cell.percentageLabel)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SelectQuestionGroupViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let questionViewController = segue.destination as? QuestionViewController
            else { return }
        questionViewController.questionStrategy = appSettings.questionStrategy(for: questionGroupCareTaker)
        questionViewController.delegate = self
    }
}

// MARK: - QuestionViewControllerDelegate
extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
    public func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionStrategy) {
        navigationController?.popToViewController(self, animated: true)
    }
    
    public func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionStrategy) {
        navigationController?.popToViewController(self, animated: true)
    }
}
