//
//  LCAuthcodeView.m
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

#import "LCAuthcodeView.h"

@implementation LCAuthcodeView
{
    NSString* _code;
}

//Override the method of super
- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    for(id subview in self.subviews){
        
        if([subview isKindOfClass:[UILabel class]]){
            [subview removeFromSuperview];
        }
    }
    
    if (_usingRandomBackgroundColor) {
        self.backgroundColor = [self randomColorWithAlpha:1];
    }
    
    //生成随机验证码
    //generate random code text
    [self randomCodeText];
    
    [self drawTextInRect:rect];
    
    [self drawCurvesInRect:rect];
}


- (void)drawTextInRect:(CGRect)rect
{
    //在label上显示验证码
    //show code on labels
    float gridWidth  = rect.size.width/_code.length;
    float gridHeight = rect.size.height;
    float width  = gridWidth * 0.8;
    float height = gridHeight * 0.8;
    float x, y;
    for (int i = 0, count = (int)_code.length; i < count; i++) {
        
        float r1 = (float)(arc4random()%200)/1000; // 0 ~ 0.2
        float r2 = (float)(arc4random()%200)/1000; // 0 ~ 0.2
        x = r1 * width + gridWidth * i;
        y = r2 * height;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [self randomColorWithAlpha:1.0];
        label.text = [_code substringWithRange:NSMakeRange(i, 1)];;
        label.textAlignment = NSTextAlignmentLeft;
        
        //设置字体大小，并允许label根据自己的frame缩小字体
        //set font and allow label resize font to fit
        label.font = [UIFont systemFontOfSize:80];
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = 0.1;
        label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        
        //旋转label，弧度为-0.2至0.2
        //rotate label , radian between -0.2 and 0.2
        float r3 = (float)(arc4random()%400)/1000 - 0.2;
        label.transform = CGAffineTransformMakeRotation(M_PI*r3);
        
        [self addSubview:label];
        
    }

}

/*
 画曲线
 draw curves
 */
- (void)drawCurvesInRect:(CGRect)rect
{
    float viewWidth  = rect.size.width;
    float viewHeight = rect.size.height;
    
    CGFloat X1,X2,X3,Y1,Y2,Y3;
    for (int i=0; i<3; i++) {
        
        X1 = (float)(arc4random()%100)/100 * viewWidth/3;
        Y1 = viewHeight/3 * i + (float)(arc4random()%100)/100 * viewHeight/3;
        
        X2 = viewWidth/3 + (float)(arc4random()%100)/100 * viewWidth/3;
        Y2 = viewHeight/3 * i +(float)(arc4random()%100)/100 * viewHeight/3;
        
        X3 = viewWidth/3 * 2 + (float)(arc4random()%100)/100 * viewWidth/3;
        Y3 = viewHeight/3 * i + (float)(arc4random()%100)/100 * viewHeight/3;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 3.0);
        CGContextSetStrokeColorWithColor(context,[self randomColorWithAlpha:0.5].CGColor);
        CGContextMoveToPoint(context, X1, Y1);
        CGContextAddQuadCurveToPoint(context,X2, Y2, X3, Y3);
        CGContextStrokePath(context);
    }

}


/*
 生成验证码
 Generate random authcode
 */
- (void)randomCodeText
{
    if (_codeTextLength<1 || _codeTextLength>30) {
        _codeTextLength = 4;
    }
    
    char code[_codeTextLength];
    for (int i = 0; i< _codeTextLength; i++)
    {
        int j = '0' + (arc4random_uniform(42));  //from '0' to 'Z' in ASCII
        
        if((j>=58 && j<= 64)){
            --i;
            continue;
        }else{
            code[i] = (char)j;
        }
    }
    
    _code = [[NSString alloc] initWithBytes:code length:_codeTextLength encoding:NSUTF8StringEncoding];

}

- (UIColor*)randomColorWithAlpha:(float)alpha
{
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


- (BOOL)verifyString:(NSString*)inputCode
{
    return (inputCode!=nil && [[inputCode uppercaseString] isEqualToString:_code]) ;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}



@end
