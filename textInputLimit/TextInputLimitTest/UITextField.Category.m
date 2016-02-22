//
//  UITextField+Category.m
//  TextInputLimitTest
//
//  Created by David on 16/1/14.
//  Copyright © 2016年 aqua. All rights reserved.
//

#import "UITextField+Category.h"
#import "NSString+Category.h"

@implementation UITextField (Category)

- (void)limitTextFieldWithBytesLength:(NSInteger)maxLength {
    NSString* toBeString = self.text;
    [self cutTextFieldString:toBeString bytesLength:maxLength];
}

//需要在 textField: shouldChangeCharactersInRange: replacementString: 方法中实现
- (BOOL)isEnabledWithBytesLength:(NSInteger)maxLength shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string {
    NSString* toBeString = [self.text stringByReplacingCharactersInRange:range withString:string];
    NSUInteger charLen = toBeString.byteLength;
    if (charLen > maxLength) {
        if (![string isEqualToString:@""]) {
            if (self.text.byteLength != maxLength) {
                [self cutTextFieldString:toBeString bytesLength:maxLength];
            }
            return NO;
        }
    }
    return YES;
}

- (void)cutTextFieldString:(NSString *)textString bytesLength:(NSInteger)maxLength {
    while (textString.byteLength > maxLength) {
        textString = [textString substringToIndex:textString.length - 1];
        self.text = textString;
    }
    
//    NSString* lang = [[UITextInputMode currentInputMode] primaryLanguage];
//    if ([lang isEqualToString:@"zh-Hans"]) {
//        UITextRange* selectedRange = [self markedTextRange];
//        //获取高亮部分
//        UITextPosition* position = [self positionFromPosition:selectedRange.start offset:0];
//        if (!position) {
//            while (textString.byteLength > maxLength) {
//                textString = [textString substringToIndex:textString.length - 1];
//                self.text = textString;
//            }
//        }
//    } else {
//        if (textString.length > maxLength) {
//            self.text = [textString substringToIndex:maxLength];
//        }
//    }
}

@end
