//
//  NSString+ZMExtension.m
//  分类
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "NSString+ZMExtension.h"

@implementation NSString (ZMExtension)

+(NSString *)zm_pathForDocuments{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString *)zm_filePathAtDocumentsWithFileName:(NSString *)fileName
{
    return [[self zm_pathForDocuments] stringByAppendingPathComponent:fileName];
}

+(NSString *)zm_pathForCaches
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString *)zm_filePathAtCachesWithFileName:(NSString *)fileName
{
    return [[self zm_pathForCaches] stringByAppendingPathComponent:fileName];
}

+(NSString *)zm_pathForMainBundle
{
    return [[NSBundle mainBundle]bundlePath];
}

+(NSString*)zm_filePathAtMainBundleWithFileName:(NSString *)fileName
{
    return [[self zm_pathForMainBundle] stringByAppendingString:fileName];
}

+(NSString *)zm_pathForTemp
{
    return NSTemporaryDirectory();
}

+(NSString *)zm_filePathAtTempWithFileName:(NSString *)fileName
{
    return [[self zm_pathForTemp] stringByAppendingString:fileName];
}

+ (NSString *)zm_pathForPreferences
{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)zm_filePathAtPreferencesWithFileName:(NSString *)fileName
{
    return [[self zm_pathForPreferences] stringByAppendingPathComponent:fileName];
}

+ (NSString *)zm_pathForSystemFile:(NSSearchPathDirectory)directory
{
    return [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) lastObject];
}
+ (NSString *)zm_filePathForSystemFile:(NSSearchPathDirectory)directory withFileName:(NSString *)fileName
{
    return [[self zm_pathForSystemFile:directory] stringByAppendingPathComponent:fileName];
}

- (CGSize)zm_sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary *arrts = @{NSFontAttributeName:font};

    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:arrts context:nil].size;
}

+ (CGSize)zm_sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    return [text zm_sizeWithFont:font andMaxSize:maxSize];
}

#pragma mark - 字符串的一些属性
-(BOOL)isBlank
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}

-(BOOL)isValid
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}


- (NSString *)removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}


- (NSUInteger)countNumberOfWords
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];

    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet: whiteSpace  intoString: nil]) {
        count++;
    }

    return count;
}


- (BOOL)containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}


- (BOOL)isBeginsWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}


- (BOOL)isEndssWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}


- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

-(NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}

- (BOOL)containsOnlyLetters
{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}

- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

- (BOOL)isInThisarray:(NSArray*)array
{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

+ (NSString *)getStringFromArray:(NSArray *)array
{
    return [array componentsJoinedByString:@" "];
}

- (NSArray *)getArray
{
    return [self componentsSeparatedByString:@" "];
}

+ (NSString *)getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleVersion = [info objectForKey:@"CFBundleVersion"];
    NSString *shortVersion = [info objectForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@.%@", shortVersion, bundleVersion];
}

+ (NSString *)getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}

- (NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
    
}





#pragma mark - 判断是否是有效的号码
// Is Valid Email

- (BOOL)zm_isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

// Is Valid Phone

- (BOOL)zm_isValidPhoneNum
{
    /*
     支持手机号段:
     移动：139   138   137   136   135   134   147   150   151   152   157   158    159   178  182   183   184   187   188
     联通： 130   131   132   155   156   185   186   145   176
     电信： 133   153   177   180   181   189
     */
    NSString *regex = @"^0?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:self];
}

// Is Valid URL

- (BOOL)zm_isValidUrl
{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}




@end
