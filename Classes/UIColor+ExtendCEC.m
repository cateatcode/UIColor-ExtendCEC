//
//  UIColor+ExtendCEC.m
//  https://github.com/cateatcode/CECDevice
//  Dual licensed under either the terms of the BSD License, or alternatively
//  under the terms of the Apache License, Version 2.0, as specified below.
//

/*
 Copyright (c) 2014, Qiang Xu
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of the Zang Industries nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 Copyright 2014 Qiang Xu
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "UIColor+ExtendCEC.h"

@implementation UIColor (ExtendCEC)

/**
 * @brief 通过十六进制配置颜色,
 * @param hexValue:十六进制数值,例如0x00AA00
 * @param alphaValue:透明度0~1.0 0为全透明,1为不透明
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

/**
 * @brief 通过十六进制配置颜色,透明度为1
 * @param hexValue:十六进制数值,例如0x00AA00
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hexValue {
    return [UIColor ccColorWithHex:hexValue alpha:1.0];
}

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hex:十六进制数值字符串,例如0x00AA00
 * @param alpha:透明度
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hex alpha:(CGFloat)alpha {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hex:十六进制数值字符串,例如0x00AA00
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hex {
    return [[self class] ccColorWithHexString:hex alpha:1.0];
}

/** 带透明度的白色,在配置某些背景时使用 */
+ (UIColor*)ccWhiteColorWithAlpha:(CGFloat)alphaValue {
    return [UIColor ccColorWithHex:0xffffff alpha:alphaValue];
}

/** 带透明度的黑色,在配置某些背景时使用 */
+ (UIColor*)ccBlackColorWithAlpha:(CGFloat)alphaValue {
    return [UIColor ccColorWithHex:0x000000 alpha:alphaValue];
}

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithR:(NSInteger)red g:(NSInteger)green b:(NSInteger)blue {
    return [[self class] ccColorWithR:red g:green b:blue a:1.0];
}

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithR:(NSInteger)red g:(NSInteger)green b:(NSInteger)blue a:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
@end