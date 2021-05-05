//
//  NewModel.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/5.
//

#import "NewModel.h"

@implementation NewModel
@synthesize title;
@synthesize headpic;
@synthesize xinFangEvent;
@synthesize xinFangTime;
@synthesize xinFangState;
@synthesize xinFangId;
@synthesize details;


- (id)init {
    if (self=[super init]) {
        // Initialize self.
        
        title = [[NSString alloc]init];
        headpic = [[NSString alloc]init];
        xinFangEvent = [[NSString alloc]init];
        xinFangTime = [[NSString alloc]init];
        xinFangState = [[NSString alloc]init];
        xinFangId = [[NSString alloc]init];
        details = [[NSString alloc]init];
  
        
    }
    
    return self;
}

-(void)setData:(NSDictionary *)dic{
    if ([[NSString stringWithFormat:@"%@",dic] isEqualToString:@"<null>"]) {
        dic=[[NSDictionary alloc]init];
    }
    
    title = [ZABaseObject returnStr:dic[@"title"]]; //文件名称
    headpic = [ZABaseObject returnStr:dic[@"headpic"]]; //图片
    xinFangEvent = [ZABaseObject returnStr:dic[@"issueUnit"]]; //文件详情
    xinFangTime = [ZABaseObject returnStr:dic[@"time"]]; //时间
    xinFangState = [ZABaseObject returnStr:dic[@"url"]]; //状态
    xinFangId = [ZABaseObject returnStr:dic[@"id"]];
    details = [ZABaseObject returnStr:dic[@"details"]];

}



@end
