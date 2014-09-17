//
//  QuestionDetailDataSource.m
//  BrowseOverflow
//
//  Created by Graham Lee on 30/08/2011.
//  Copyright (c) 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import "QuestionDetailDataSource.h"
#import "QuestionDetailCell.h"
#import "AnswerCell.h"
#import "Answer.h"
#import "Question.h"
#import "Person.h"
#import "AvatarStore.h"

enum {
    questionSection = 0,
    answerSection = 1,
    sectionCount
    };

@interface QuestionDetailDataSource ()

- (NSString *)HTMLStringForSnippet: (NSString *)snippet;

@end

@implementation QuestionDetailDataSource

@synthesize question;
@synthesize detailCell;
@synthesize answerCell;
@synthesize avatarStore;

- (NSString *)HTMLStringForSnippet:(NSString *)snippet {
    return [NSString stringWithFormat: @"<html><head></head><body>%@</body></html>", snippet];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == answerSection) ? [question.answers count] : 1; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == questionSection) {
        [[NSBundle bundleForClass: [self class]] loadNibNamed: @"QuestionDetailCell" owner: self options: nil];
        [detailCell.bodyWebView loadHTMLString: [self HTMLStringForSnippet: question.body] baseURL: nil];
        detailCell.titleLabel.text = question.title;
        detailCell.scoreLabel.text = [NSString stringWithFormat: @"%i", question.score];
        detailCell.nameLabel.text = question.asker.name;
        detailCell.avatarView.image = [UIImage imageWithData: [avatarStore dataForURL: question.asker.avatarURL]];
        cell = detailCell;
        self.detailCell = nil;
    }
    else if (indexPath.section == answerSection) {
        Answer *thisAnswer = [question.answers objectAtIndex: indexPath.row];
        [[NSBundle bundleForClass: [self class]] loadNibNamed: @"AnswerCell" owner: self options: nil];
        answerCell.scoreLabel.text = [NSString stringWithFormat: @"%d", thisAnswer.score];
        answerCell.acceptedIndicator.hidden = !thisAnswer.accepted;
        Person *answerer = thisAnswer.person;
        answerCell.personName.text = answerer.name;
        answerCell.personAvatar.image = [UIImage imageWithData: [avatarStore dataForURL: answerer.avatarURL]];
        [answerCell.bodyWebView loadHTMLString: [self HTMLStringForSnippet: thisAnswer.text] baseURL: nil];
        cell = answerCell;
        self.answerCell = nil;
    }
    else {
        NSParameterAssert(indexPath.section < sectionCount);
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == questionSection) {
        return 276.0f;
    }
    else {
        return 201.0f;
    }
}
@end
