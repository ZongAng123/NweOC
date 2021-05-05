//
//  ZAPublicFunction.h
//  NewOC
//
//  Created by 纵昂 on 2021/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZAPublicFunction : NSObject
+(UIImage *)createImageWithColor:(UIColor *)color;//通过颜色创建图片
+(NSString *)dropZeroAfterDecimalPointWithFloat:(id)object;//金钱去掉最后的0
+(void)xiugailabel:(UILabel *)label jianju:(CGFloat)jianju;//修改label的间距
+(CGRect)Rectlabel:(NSString *)text font:(UIFont *)font size:(CGSize)size;
+(CGRect)Rectlabel:(NSString *)text font:(UIFont *)font size:(CGSize)size spacing:(CGFloat)spacing;
+(BOOL)containChinese:(NSString *)str;//是否是中文
+(NSString *)stringwithdatequmiao:(NSDate *)date;//NSDate转NSString
+(NSString *)returnPhoneType;

@end

NS_ASSUME_NONNULL_END
