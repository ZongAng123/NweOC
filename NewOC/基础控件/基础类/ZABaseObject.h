//
//  ZABaseObject.h
//  NewOC
//
//  Created by 纵昂 on 2021/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZABaseObject : NSObject
+(NSString *)returnStr:(NSString *)str;
+(NSMutableArray *)returnArr:(NSArray *)arr;
+(NSMutableDictionary *)returnDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
