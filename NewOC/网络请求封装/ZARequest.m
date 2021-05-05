//
//  ZARequest.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/4.
//

#import "ZARequest.h"

@implementation ZARequest
-(NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString *userId = [userDefaults objectForKey:@"KEY_USER_USERID"];
//    NSString *token = [userDefaults objectForKey:@"KEY_USER_TOKEN"];
    
//    return @{@"Token":token};
    return @{@"Token":@"3333333333333"};
    
}

- (void)requestFailedPreprocessor
{
  //note：子类如需继承，必须必须调用 [super requestFailedPreprocessor];
  [super requestFailedPreprocessor];
  
  NSError * error = self.error;
  
//  if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain])
//  {
//    //AFNetworking处理过的错误
//
//  }else
    if ([error.domain isEqualToString:YTKRequestValidationErrorDomain])
  {
    //猿题库处理过的错误
    NSLog(@"猿题库error");
    
  }else{
    //系统级别的domain错误，无网络等[NSURLErrorDomain]
    //根据error的code去定义显示的信息，保证显示的内容可以便捷的控制
  }
  [SVProgressHUD showErrorWithStatus:@"网络错误"];
}

@end
