//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/16.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

public protocol QuestionStrategy: class {
    var titile: String { get }
    
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    
    func currentQuestion() -> Question
    
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    func questionIndexTitle() -> String
}
