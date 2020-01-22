//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/16.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import Foundation

public class SequentialQuestionStrategy: BaseQuestionStrategy {
    public convenience init(questionGroupCareTaker: QuestionGroupCareTaker) {
        let questionGroup = questionGroupCareTaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCareTaker: questionGroupCareTaker, questions: questions)
    }
}
