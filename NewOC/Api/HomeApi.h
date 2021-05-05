//
//  HomeApi.h
//  NewOC
//
//  Created by 纵昂 on 2021/5/4.
//

#import "ZARequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeApi : ZARequest
- (id)type:(NSString *)typeId page:(NSString *)page psize:(NSString *)psize;
@end

NS_ASSUME_NONNULL_END
