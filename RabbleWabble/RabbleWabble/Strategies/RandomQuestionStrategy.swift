//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/16.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {
    
    // MARK: - Object Lifecycle
    public convenience init(questionGroupCareTaker: QuestionGroupCareTaker) {
        let questionGroup = questionGroupCareTaker.selectedQuestionGroup!
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
        self.init(questionGroupCareTaker: questionGroupCareTaker, questions: questions)
    }
}
