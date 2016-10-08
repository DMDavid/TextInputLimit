//
//  ViewController.m
//  TextInputLimitTest
//
//  Created by David on 16/1/14.
//  Copyright © 2016年 orangeCat. All rights reserved.
//

#define MaxNumberOfDescriptionChars 10


#import "ViewController.h" 
#import "TextFieldLimitManager.h"

@interface ViewController () <TextFieldLimitDelegate>

@property (nonatomic, strong) TextFieldLimitManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _manager = [[TextFieldLimitManager alloc] init];
    [_manager limitTextField:self.textfield bytesLength:MaxNumberOfDescriptionChars];
    _manager.limitDelegate = self;
}


#pragma mark - 

- (void)limitTextFieldDidChange:(UITextField *)textField {
    NSLog(@"文本变化 -- %@", textField.text);
}

@end
