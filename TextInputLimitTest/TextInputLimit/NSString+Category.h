//
//  NSString+Category.h
//  TextInputLimitTest
//
//  Created by David on 16/1/14.
//  Copyright © 2016年 orangeCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

- (NSInteger)byteLength;

//判断字符串的字符个数
+ (int)getCharacterFormStr:(NSString *)tempStr;

//过滤emoji
- (BOOL)stringContainsEmoji;
@end
