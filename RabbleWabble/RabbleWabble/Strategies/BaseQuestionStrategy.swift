//
//  BaseQuestionStrategy.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/20.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import Foundation

public class BaseQuestionStrategy: QuestionStrategy {
    // MARK: - Properties
    public var correctCount: Int {
        get { return questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    public var incorrectCount: Int {
        get { return questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    
    private var questionGroupCareTaker: QuestionGroupCareTaker
    
    private var questionGroup: QuestionGroup {
        return questionGroupCareTaker.selectedQuestionGroup
    }
    private var questionIndex = 0
    private let questions: [Question]
    
    // MARK: Object LifeCycle
    init(questionGroupCareTaker: QuestionGroupCareTaker, questions: [Question]) {
        self.questionGroupCareTaker = questionGroupCareTaker
        self.questions = questions
        self.questionGroupCareTaker.selectedQuestionGroup.score.reset()
    }
    
    // MARK: - QuestionStrategy
    public var titile: String {
        return questionGroup.title
    }
    
    public func advanceToNextQuestion() -> Bool {
        try? questionGroupCareTaker.save()
        guard questionIndex + 1 < questionGroup.questions.count else {
            return false
        }
        
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex) / \(questions.count)"
    }
}
