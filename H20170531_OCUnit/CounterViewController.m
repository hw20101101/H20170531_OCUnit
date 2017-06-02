//
//  ViewController.m
//  H20170531_OCUnit
//
//  Created by hw on 2017/5/31.
//  Copyright © 2017年 GaiaMagic. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@end

@implementation CounterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (id)initWithCounter:(Counter *)counter{
    self = [super init];
    
    if (self) {
        _counter = counter;
        _plusButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
        [_plusButton2 addTarget:self action:@selector(incrementCount) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_plusButton2];
        
        _counterLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 100, 20)];
        [self.view addSubview:_counterLabel2];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modelChanged:) name:CounterModelChanged object:_counter];
    }
    return self;
}

- (void)incrementCount{
    
}

- (IBAction)incrementCount:(id)sender {
}

- (IBAction)minusCount:(id)sender {
}

- (void)modelChanged:(NSNotification *)noti{
    _counterLabel2.text = [NSString stringWithFormat:@"%d", _counter.count];
}

//- (IBAction)plusButtonAction:(id)sender {
//    
//    
//}
//
//- (IBAction)minusButtonAction:(id)sender {
//
//}


@end
