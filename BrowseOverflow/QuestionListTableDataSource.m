//
//  QuestionListTableDataSource.m
//  BrowseOverflow
//
//  Created by Graham Lee on 11/08/2011.
//  Copyright (c) 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import "QuestionListTableDataSource.h"
#import "QuestionSummaryCell.h"
#import "Topic.h"
#import "Question.h"
#import "Person.h"
#import "AvatarStore.h"

@implementation QuestionListTableDataSource 

@synthesize topic;
@synthesize summaryCell;
@synthesize avatarStore;
@synthesize tableView;
@synthesize notificationCenter;

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [[topic recentQuestions] count] ?: 1;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if ([topic.recentQuestions count]) {
        Question *question = [topic.recentQuestions objectAtIndex: indexPath.row];
        summaryCell = [tableView dequeueReusableCellWithIdentifier: @"question"];
        if (!summaryCell) {
            [[NSBundle bundleForClass: [self class]] loadNibNamed: @"QuestionSummaryCell" owner: self options: nil];
        }
        summaryCell.titleLabel.text = question.title;
        summaryCell.scoreLabel.text = [NSString stringWithFormat: @"%d", question.score];
        summaryCell.nameLabel.text = question.asker.name;
        
        NSData *avatarData = [avatarStore dataForURL: question.asker.avatarURL];
        if (avatarData) {
            summaryCell.avatarView.image = [UIImage imageWithData: avatarData];
        }
        cell = summaryCell;
        summaryCell = nil;
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier: @"placeholder"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"placeholder"];
        }
        cell.textLabel.text = @"There was a problem.";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[topic recentQuestions] count] > 0) {
        NSNotification *notification = [NSNotification notificationWithName: QuestionListDidSelectQuestionNotification object: [topic.recentQuestions objectAtIndex: indexPath.row]];
        [notificationCenter postNotification: notification];
    }
}

- (void)registerForUpdatesToAvatarStore:(AvatarStore *)store {
    [notificationCenter addObserver: self selector: @selector(avatarStoreDidUpdateContent:) name: AvatarStoreDidUpdateContentNotification object: store];
}

- (void)removeObservationOfUpdatesToAvatarStore: (AvatarStore *)store {
    [notificationCenter removeObserver: self name: AvatarStoreDidUpdateContentNotification object: store];
}

- (void)avatarStoreDidUpdateContent:(NSNotification *)notification {
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 132.0f;
}

@end

NSString *QuestionListDidSelectQuestionNotification = @"QuestionListDidSelectQuestionNotification";
