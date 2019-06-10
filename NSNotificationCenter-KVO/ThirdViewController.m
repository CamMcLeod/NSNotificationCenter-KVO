//
//  ThirdViewController.m
//  NSNotificationCenter-KVO
//
//  Created by Cameron Mcleod on 2019-06-09.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (nonatomic, readonly) CGFloat oldConstraint;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    _oldConstraint = self.bottomConstraint.constant;
}

- (void)keyboardDidChange: (NSNotification *)notification {
    NSLog(@"%@", notification.userInfo);
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    NSLog(@"rect origin y: %@", NSStringFromCGRect(rect));
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if(yPos == viewHeight) {
        // set to default
        self.bottomConstraint.constant = self.oldConstraint;
    } else {
        // height minus the keyboard's y-pos
        self.bottomConstraint.constant = viewHeight - yPos;
        
    }
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}

@end
