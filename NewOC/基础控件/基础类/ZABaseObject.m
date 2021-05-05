//
//  ZABaseObject.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/5.
//

#import "ZABaseObject.h"

@implementation ZABaseObject

+ (BOOL)exist:(id)object{
    if (object) {
        if ([object isKindOfClass:[NSNull class]]){
            return NO;
        }else if ([object isKindOfClass:[NSString class]] &&
                  [object isEqualToString:@"<null>"]){
            return NO;
        }
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)existString:(id)object{
    BOOL ret = NO;
    if ([self exist:object]) {
        if ([object isKindOfClass:[NSString class]]){
            ret = YES;
        }
    }
    return ret;
}

+ (BOOL)existNumber:(id)object{
    BOOL ret = NO;
    if ([self exist:object]) {
        if ([object isKindOfClass:[NSNumber class]]){
            ret = YES;
        }
    }
    return ret;
}

+ (BOOL)existArray:(id)object{
    BOOL ret = NO;
    if ([self exist:object]) {
        if ([object isKindOfClass:[NSArray class]]){
            ret = YES;
        }
    }
    return ret;
}

+ (BOOL)existDictionary:(id)object{
    BOOL ret = NO;
    if ([self exist:object]) {
        if ([object isKindOfClass:[NSDictionary class]]){
            ret = YES;
        }
    }
    return ret;
}

+ (NSString *)returnStr:(NSString *)str{
    if ([self existString:str]) {
        return [NSString stringWithString:str];
    }else if ([self existNumber:str]){
        return [NSString stringWithFormat:@"%@",str];
    }else{
        return @"";
    }
}

+ (NSMutableArray *)returnArr:(NSArray *)arr{
    if ([self existArray:arr]) {
        //arrayWithArray 会创建一个新的对象
        return [NSMutableArray arrayWithArray:arr];
    }else{
        return [NSMutableArray new];
    }
}

+ (NSMutableDictionary *)returnDic:(NSDictionary *)dic{
    if ([self existDictionary:dic]) {
        return [NSMutableDictionary dictionaryWithDictionary:dic];
    }else{
        return [NSMutableDictionary new];
    }
}


@end
