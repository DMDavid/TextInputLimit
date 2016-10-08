//
//  TextFieldManager.m
//  TextInputLimitTest
//
//  Created by David on 16/10/8.
//  Copyright © 2016年 orangeCat. All rights reserved.
//

#import "TextFieldManager.h"
#import "UITextField+Category.h"

@interface TextFieldManager() <UITextFieldDelegate>

@property (nonatomic, assign) NSInteger maxNumberOfDescriptionChars;    //最大限制字符个数

@end

@implementation TextFieldManager

- (void)limitTextField:(UITextField *)textField bytesLength:(NSInteger)maxLength {
    //赋值代理
    textField.delegate = self;
    self.maxNumberOfDescriptionChars = maxLength;
}


#pragma mark - UITextFieldDelegate

// 监听文本改变
- (void)textFieldDidChange:(UITextField*)textField
{
    [textField limitTextFieldWithBytesLength:self.maxNumberOfDescriptionChars];
    
    //设置代理 (扩展)
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(limitTextFieldDidChange:)]) {
        [self.limitDelegate limitTextFieldDidChange:textField];
    }
}


#pragma mark-- UITextfielfDelegate imp
- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    return [textField isEnabledWithBytesLength:self.maxNumberOfDescriptionChars shouldChangeCharactersInRange:range replacementString:string];
}


@end
