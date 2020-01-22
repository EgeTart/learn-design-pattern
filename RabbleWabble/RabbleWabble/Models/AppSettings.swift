//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/19.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import Foundation

public class AppSettings {
    // MARK: Keys
    struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    // MARK: Static Properties
    public static let shared = AppSettings()
    
    var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefault.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        } set {
            userDefault.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    private let userDefault = UserDefaults.standard
    
    // MARK: Object Lifecycle
    private init() { }
    
    // MARK: - Instance Methods
    func questionStrategy(for questionGroupCareTaker: QuestionGroupCareTaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroupCareTaker)
    }
}


// MARK: QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
    case random
    case sequential
    
    // MARK: Instance methods
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func questionStrategy(for questionGroupCareTaker: QuestionGroupCareTaker) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(questionGroupCareTaker: questionGroupCareTaker)
        case .sequential:
            return SequentialQuestionStrategy(questionGroupCareTaker: questionGroupCareTaker)
        }
    }
}
