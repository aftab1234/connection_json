//
//  Programming_DemoViewController.m
//  connection_json1
//
//  Created by Sam on 18/02/15.
//  Copyright (c) 2015 Bets. All rights reserved.
//

#import "Programming_DemoViewController.h"

@interface Programming_DemoViewController ()

@end

@implementation Programming_DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:@"http://api.twitter.com/1/statuses/user_timeline.json?screen_name=jadoon88"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSArray *publicTimeline = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    NSDictionary *tweet;
    
    for(int i=0; i<[publicTimeline count];i++)
    {
        tweet= [publicTimeline objectAtIndex:i];
       NSLog(@"Statuses:%@”, [tweet objectForKey:@"text"]);
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
