//
//  Question.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/7.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import Foundation

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    public init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
