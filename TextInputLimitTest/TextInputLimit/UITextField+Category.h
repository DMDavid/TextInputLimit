//
//  UITextField+Category.h
//  TextInputLimitTest
//
//  Created by David on 16/1/14.
//  Copyright © 2016年 orangeCat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

#pragma mark - For length
//- (void)limitTextFieldWithLength:(NSInteger)maxLength;

#pragma mark - For bytes length
//你需要实现下面两个方法配合TextField代理使用
//通知中实现
- (void)limitTextFieldWithBytesLength:(NSInteger)maxLength;
//需要在 textField: shouldChangeCharactersInRange: replacementString: 方法中实现
- (BOOL)isEnabledWithBytesLength:(NSInteger)maxLength shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string;
@end
