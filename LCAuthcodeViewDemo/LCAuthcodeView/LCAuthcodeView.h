//
//  LCAuthcodeView.h
//  LCAuthCodeViewDemo
//
// Copyright (c) 2015 LCAuthcodeView
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <UIKit/UIKit.h>




@interface LCAuthcodeView : UIView

/*
 将这个属性设为YES会在每次生成验证码时随机生成背景色, 默认为NO
 The view will generate random background color if set this property to YES,default is NO
 */
@property(nonatomic,assign) BOOL usingRandomBackgroundColor;

/*
 验证码的长度，如不设置则默认是4
 length of code text, default is 4
 */
@property(nonatomic,assign) int codeTextLength;


/*
 验证输入字符串是否和view上的验证码一致，忽略大小写，如一致则返回YES
 verify the inputCode,case insensitive
 */
- (BOOL)verifyString:(NSString*)inputCode;

@end





