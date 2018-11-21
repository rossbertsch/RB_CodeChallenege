//
//  JobDetailViewController.m
//  RB_CodeChallenege
//
//  Created by Ross Bertsch on 11/21/18.
//  Copyright © 2018 rbertsch. All rights reserved.
//

#import "JobDetailViewController.h"
#import "GitJob.h"

@interface JobDetailViewController ()

@property (nonatomic, weak) IBOutlet UITextView *jobDescriptionTextView;
@property (nonatomic, weak) IBOutlet UILabel *jobTitleLabel;

@end

@implementation JobDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self displayJobDescription];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)displayJobDescription {
    self.jobTitleLabel.text = self.selectedJob.title;
    NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithData: [self.selectedJob.details dataUsingEncoding:NSUnicodeStringEncoding]
                                            options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                            documentAttributes: nil
                                            error: nil
                                            ];
    self.jobDescriptionTextView.attributedText = attributedString;
}

@end
