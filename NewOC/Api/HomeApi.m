//
//  HomeApi.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/4.
//

#import "HomeApi.h"

@implementation HomeApi
{
    NSString *_typeId;
    NSString *_page;
    NSString *_psize;
}


- (id)type:(NSString *)typeId page:(NSString *)page psize:(NSString *)psize{
    if (self) {
        _typeId = typeId;
        _page = page;
        _psize = psize;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/api/selfnews/newslist";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"type":_typeId,
             @"page":_page,
             @"psize":_psize,
             };
}


@end
