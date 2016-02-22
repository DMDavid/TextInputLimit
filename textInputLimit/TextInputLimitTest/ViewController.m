//
//  ViewController.m
//  TextInputLimitTest
//
//  Created by aqua on 14-9-2.
//  Copyright (c) 2014年 aqua. All rights reserved.
//

#define MaxNumberOfDescriptionChars 10


#import "ViewController.h"
#import "UITextField+Category.h" 

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.textfield.delegate = self;
    [self.textfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];  
}

// 监听文本改变
- (void)textFieldDidChange:(UITextField*)textField
{
    [textField limitTextFieldWithBytesLength:MaxNumberOfDescriptionChars];
}


#pragma mark-- UITextfielfDelegate imp
- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    return [textField isEnabledWithBytesLength:MaxNumberOfDescriptionChars shouldChangeCharactersInRange:range replacementString:string];
}

@end
