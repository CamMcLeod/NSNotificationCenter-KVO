//
//  SecondViewController.m
//  NSNotificationCenter-KVO
//
//  Created by Cameron Mcleod on 2019-06-09.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stepperCounterLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

-(void)viewWillAppear:(BOOL)animated {
    
    [NSNotificationCenter.defaultCenter addObserver:self selector: @selector(stepperChanged:) name: @"stepperWasChanged" object: nil];
    
    NSDictionary *requestStepValue = @{ @"stepperRequest" : [NSNumber numberWithDouble: 0]};
    
    NSNotification *stepperRequestNotification = [[NSNotification alloc] initWithName:@"stepperValueRequest" object:self.stepperCounterLabel userInfo: requestStepValue];
    
    [NSNotificationCenter.defaultCenter postNotification:stepperRequestNotification];
    
}

- (void)stepperChanged: (NSNotification *)notification{
    NSDictionary *stepDict = [notification userInfo];
    
    self.stepperCounterLabel.text = [NSString stringWithFormat:@"%@", [stepDict valueForKey:@"stepperValue"]];
    
}

- (void)dealloc {
    
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
