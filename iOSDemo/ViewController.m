//
//  ViewController.m
//  iOSDemo
//
//  Created by wanhong cai on 2019/4/4.
//  Copyright © 2019 Koolearn. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/FlutterViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [self presentViewController:flutterViewController animated:YES completion:nil];
}
@end
