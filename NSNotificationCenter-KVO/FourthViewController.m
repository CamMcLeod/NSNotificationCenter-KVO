//
//  FourthViewController.m
//  NSNotificationCenter-KVO
//
//  Created by Cameron Mcleod on 2019-06-10.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomView.h"

@interface FourthViewController ()

@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet CustomView *whiteView;


@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
 
    NSLog(@"change %@", change);
    
    if ([keyPath isEqualToString:@"point"]) {
     
        id value = change[NSKeyValueChangeNewKey];
        NSLog(@"val %@", value);
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        NSLog(@"point %@", NSStringFromCGPoint(point));
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        yellowX += point.x / 10;
        yellowY += point.y / 10;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellowView.center = newCenter;
        
    }
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(isFinished))]) {
        if ([object isFinished]) {
            @try {
                [object removeObserver:self forKeyPath:NSStringFromSelector(@selector(isFinished))];
            }
            @catch (NSException * __unused exception) {}
        }
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
