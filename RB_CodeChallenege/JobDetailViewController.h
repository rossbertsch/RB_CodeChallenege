//
//  JobDetailViewController.h
//  RB_CodeChallenege
//
//  Created by Ross Bertsch on 11/21/18.
//  Copyright © 2018 rbertsch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GitJob.h"

@interface JobDetailViewController : UIViewController

@property (nonatomic, strong) GitJob *selectedJob;

@end
