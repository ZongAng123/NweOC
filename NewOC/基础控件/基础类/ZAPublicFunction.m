//
//  ZAPublicFunction.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/5.
//

#import "ZAPublicFunction.h"
#import <sys/utsname.h>

@implementation ZAPublicFunction
+(UIImage *)createImageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (NSString *)dropZeroAfterDecimalPointWithFloat:(id)object{
    if (object && ([object isKindOfClass:[NSNumber class]] ||
                   [object isKindOfClass:[NSString class]])) {
        NSString *str = [NSString stringWithFormat:@"%@",object];
        if (str.length > 0) {
            str = [NSString stringWithFormat:@"%.2f",[object floatValue]];
            NSRange range = [str rangeOfString:@"."];
            if (range.location != 0) {
                if ([str hasSuffix:@"0"]) {
                    str = [str substringToIndex:range.location+2];
                }
                if ([str hasSuffix:@"0"]) {
                    str = [str substringToIndex:range.location];
                }
            }
        }else{
            str = @"0";
        }
        return [NSString stringWithString:str];
    }else{
        return object;
    }
}

+(void)xiugailabel:(UILabel *)label jianju:(CGFloat)jianju
{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:jianju];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributedString];
}

+(CGRect)Rectlabel:(NSString *)text font:(UIFont *)font size:(CGSize)size
{
    CGRect Rect=[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    
    return Rect;
}

+(CGRect)Rectlabel:(NSString *)text font:(UIFont *)font size:(CGSize)size spacing:(CGFloat)spacing
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    
    CGRect Rect=[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,paragraphStyle,NSParagraphStyleAttributeName,nil] context:nil];
    
    if ((Rect.size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([self containChinese:text]) {  //如果包含中文
            Rect = CGRectMake(Rect.origin.x, Rect.origin.y, Rect.size.width, Rect.size.height-paragraphStyle.lineSpacing);
        }
    }
    
    return Rect;
}

+(BOOL)containChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    
    return NO;
}

+(NSString *)stringwithdatequmiao:(NSDate *)date//NSDate转NSString
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate=[dateFormatter stringFromDate:date];
    
    return strDate;
}

+(NSString *)returnPhoneType{
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    
    //手机型号
    NSString * phoneModel;
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"]){
        phoneModel = @"iPhone 1G";
    }else if ([deviceString isEqualToString:@"iPhone1,2"]){
        phoneModel = @"iPhone 3G";
    }else if ([deviceString isEqualToString:@"iPhone2,1"]){
        phoneModel = @"iPhone 3GS";
    }else if ([deviceString isEqualToString:@"iPhone3,1"]){
        phoneModel = @"iPhone 4";
    }else if ([deviceString isEqualToString:@"iPhone3,2"]){
        phoneModel = @"Verizon iPhone 4";
    }else if ([deviceString isEqualToString:@"iPhone4,1"]){
        phoneModel = @"iPhone 4S";
    }else if ([deviceString isEqualToString:@"iPhone5,1"]){
        phoneModel = @"iPhone 5";
    }else if ([deviceString isEqualToString:@"iPhone5,2"]){
        phoneModel = @"iPhone 5";
    }else if ([deviceString isEqualToString:@"iPhone5,3"]){
        phoneModel = @"iPhone 5C";
    }else if ([deviceString isEqualToString:@"iPhone5,4"]){
        phoneModel = @"iPhone 5C";
    }else if ([deviceString isEqualToString:@"iPhone6,1"]){
        phoneModel = @"iPhone 5S";
    }else if ([deviceString isEqualToString:@"iPhone6,2"]){
        phoneModel = @"iPhone 5S";
    }else if ([deviceString isEqualToString:@"iPhone7,1"]){
        phoneModel = @"iPhone 6 Plus";
    }else if ([deviceString isEqualToString:@"iPhone7,2"]){
        phoneModel = @"iPhone 6";
    }else if ([deviceString isEqualToString:@"iPhone8,1"]){
        phoneModel = @"iPhone 6S";
    }else if ([deviceString isEqualToString:@"iPhone8,2"]){
        phoneModel = @"iPhone 6S Plus";
    }else if ([deviceString isEqualToString:@"iPhone8,4"]){
        phoneModel = @"iPhone SE";
    }else if ([deviceString isEqualToString:@"iPhone9,1"]){
        phoneModel = @"iPhone 7";
    }else if ([deviceString isEqualToString:@"iPhone9,2"]){
        phoneModel = @"iPhone 7 Plus";
    }else if ([deviceString isEqualToString:@"iPhone10,1"]){
        phoneModel = @"iPhone 8";
    }else if ([deviceString isEqualToString:@"iPhone10,2"]){
        phoneModel = @"iPhone 8 Plus";
    }else if ([deviceString isEqualToString:@"iPhone10,3"]){
        phoneModel = @"iPhone X";
    }else if ([deviceString isEqualToString:@"iPhone10,4"]){
        phoneModel = @"iPhone 8";
    }else if ([deviceString isEqualToString:@"iPhone10,5"]){
        phoneModel = @"iPhone 8 Plus";
    }else if ([deviceString isEqualToString:@"iPhone10,6"]){
        phoneModel = @"iPhone X";
    }else if ([deviceString isEqualToString:@"iPhone11,8"]){
        phoneModel = @"iPhone XR";
    }else if ([deviceString isEqualToString:@"iPhone11,6"]){
        phoneModel = @"iPhone XS Max";
    }else if ([deviceString isEqualToString:@"iPhone11,2"]){
        phoneModel = @"iPhone XS";
    }else if ([deviceString isEqualToString:@"iPhone11,4"]){
        phoneModel = @"iPhone XS Max";
    }
    
    
    return [NSString stringWithFormat:@"手机系统：%@，手机型号：%@",phoneVersion,phoneModel];
}


@end
