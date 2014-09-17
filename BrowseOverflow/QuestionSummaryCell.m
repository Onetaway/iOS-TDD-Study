//
//  QuestionSummaryCell.m
//  BrowseOverflow
//
//  Created by Graham Lee on 16/08/2011.
//  Copyright (c) 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import "QuestionSummaryCell.h"

@implementation QuestionSummaryCell

@synthesize titleLabel;
@synthesize scoreLabel;
@synthesize nameLabel;
@synthesize avatarView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
