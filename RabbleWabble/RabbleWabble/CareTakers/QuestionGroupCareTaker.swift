//
//  QuestionGroupCareTaker.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/20.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import Foundation

public final class QuestionGroupCareTaker {
    // MARK: - Properties
    private let fileName = "QuestionGroupData"
    public var questionGroups = [QuestionGroup]()
    public var selectedQuestionGroup: QuestionGroup!
    
    public init() {
        loadQuestionGroups()
    }
    
    private func loadQuestionGroups() {
        if let questionGroups = try? DiskCareTaker.retrieve([QuestionGroup].self, from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName, withExtension: "json")!
            self.questionGroups = try! DiskCareTaker.retrieve([QuestionGroup].self, from: url)
            try! save()
        }
    }
    
    // MARK: Instance Methods
    func save() throws {
        try DiskCareTaker.save(questionGroups, to: fileName)
    }
}
