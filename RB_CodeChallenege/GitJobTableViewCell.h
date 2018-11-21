//
//  GitJobTableViewCell.h
//  RB_CodeChallenege
//
//  Created by Ross Bertsch on 11/21/18.
//  Copyright © 2018 rbertsch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GitJobTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *companyLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationLabel;

@end
