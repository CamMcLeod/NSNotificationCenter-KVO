//
//  ViewController.m
//  NSNotificationCenter-KVO
//
//  Created by Cameron Mcleod on 2019-06-09.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.stepper.value = 0;
}


- (IBAction)stepperChanged:(UIStepper *)sender {
    
    NSDictionary *stepDict = @{ @"stepperValue" : [NSNumber numberWithDouble:self.stepper.value]};
    
    NSNotification *stepperNotification = [[NSNotification alloc] initWithName:@"stepperWasChanged" object:sender userInfo:stepDict];
    
    [NSNotificationCenter.defaultCenter postNotification:stepperNotification];
}
@end
