//
//  GitJob.h
//  RB_CodeChallenege
//
//  Created by Ross Bertsch on 11/21/18.
//  Copyright © 2018 rbertsch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GitJob : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *location;

@property (nonatomic, strong) NSString *details;

@end
