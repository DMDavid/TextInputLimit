//
//  NSString+Category.m
//  TextInputLimitTest
//
//  Created by David on 16/1/14.
//  Copyright © 2016年 orangeCat. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

//注：第一个方法 emoji也按2个字符算， 第二个方法用Unicode编码后是按4个字符算的

#pragma mark - func one
- (NSInteger)byteLength {
    //拿到所有str的length长度（包括中文英文..都算为1个字符）
    NSUInteger len = self.length;
    //汉字字符集
    NSString* pattern = @"[\u4e00-\u9fa5]";
    //正则表达式筛选条件
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    //计算中文字符的个数
    NSInteger numMatch = [regex numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, len)];
    //len已经把中文算进去了，中文少的一个字符通过numMatch个数来补充，效果就是中文2个字符，英文1个字符
    return len + numMatch;
}

#pragma mark - func two
//判断字符串的字符个数
+ (int)getCharacterFormStr:(NSString *)tempStr {
    int strlength = 0;
    char* p = (char*)[tempStr cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[tempStr lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    return strlength;
}

- (BOOL)stringContainsEmoji
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}
@end
