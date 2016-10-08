//
//  TextFieldLimitManager.h
//  TextInputLimitTest
//
//  Created by David on 16/10/8.
//  Copyright © 2016年 orangeCat. All rights reserved.
//

@protocol TextFieldLimitDelegate <NSObject>
@optional
- (void)limitTextFieldDidChange:(UITextField*)textField;

@end

#import <Foundation/Foundation.h>

@interface TextFieldLimitManager : NSObject

@property (nonatomic, assign) id<TextFieldLimitDelegate> limitDelegate;


///maxLength 限制最大的字符
- (void)limitTextField:(UITextField *)textField bytesLength:(NSInteger)maxLength;

@end
