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

@end
