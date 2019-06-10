//
//  CustomView.m
//  NSNotificationCenter-KVO
//
//  Created by Cameron Mcleod on 2019-06-10.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)whiteViewPanned:(UIPanGestureRecognizer *)sender {
    
    //    CGPoint locationInView = [sender locationInView:self.view];
    //    sender.view.center = locationInView;
    
    self.point = [sender translationInView: self];
    
}

@end
