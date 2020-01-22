//
//  QuestionGroupCell.swift
//  RabbleWabble
//
//  Created by gaoyongxiao on 2020/1/14.
//  Copyright © 2020 gaoyongxiao. All rights reserved.
//

import UIKit
import Combine

public class QuestionGroupCell: UITableViewCell {
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var percentageLabel: UILabel!
    
    public var percentageSubscriber: AnyCancellable?
}
