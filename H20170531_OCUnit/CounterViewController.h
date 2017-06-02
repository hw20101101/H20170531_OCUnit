//
//  ViewController.h
//  H20170531_OCUnit
//
//  Created by hw on 2017/5/31.
//  Copyright © 2017年 GaiaMagic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Counter.h"

@interface CounterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;

@property (strong, nonatomic) UIButton *plusButton2;
@property (strong, nonatomic) UILabel *counterLabel2;

@property (strong, nonatomic) Counter *counter;

- (id)initWithCounter:(Counter *)counter;
- (IBAction)incrementCount:(id)sender;
- (IBAction)minusCount:(id)sender;
- (void)incrementCount;

@end

