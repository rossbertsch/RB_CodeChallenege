//
//  ViewController.m
//  RB_CodeChallenege
//
//  Created by Ross Bertsch on 11/21/18.
//  Copyright © 2018 rbertsch. All rights reserved.
//

#import "ViewController.h"
#import "GitJobTableViewCell.h"
#import "JobDetailViewController.h"
#import "GitJob.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *gitJobsArray;
@property (nonatomic, strong) GitJob *selectedJob;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchJobs];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)fetchJobs {
    NSURL *jobsUrl = [NSURL URLWithString:@"https://jobs.github.com/positions.json?description=ruby&page=1"];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:jobsUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jobsDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        self.gitJobsArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in jobsDict) {
            GitJob *job = [[GitJob alloc] init];
            job.title = [dict objectForKey:@"title"];
            job.location = [dict objectForKey:@"location"];
            job.details = [dict objectForKey:@"description"];
            job.company = [dict objectForKey:@"company"];
            NSLog(@"title : %@", job.details);
            [self.gitJobsArray addObject:job];
        }
        [self.tableView reloadData];
    }];
    
    [downloadTask resume];
}
# pragma mark - UITableView Datasource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"GitJobCell";
    GitJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    GitJob *jobObject = [self.gitJobsArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = jobObject.title;
    cell.locationLabel.text = jobObject.location;
    cell.companyLabel.text = jobObject.company;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.gitJobsArray count];
}

# pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedJob = [self.gitJobsArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

# pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailSegue"])
    {
        JobDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.selectedJob = self.selectedJob;
    }
}
@end
