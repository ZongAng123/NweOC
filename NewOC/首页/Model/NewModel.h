//
//  NewModel.h
//  NewOC
//
//  Created by 纵昂 on 2021/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewModel : ZABaseObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *headpic;
@property (nonatomic,strong) NSString *xinFangEvent;
@property (nonatomic,strong) NSString *xinFangTime;
@property (nonatomic,strong) NSString *xinFangState;//0待下派 1待核实 2核实中 3已反馈
@property (nonatomic,strong) NSString *xinFangId;
@property (nonatomic,strong) NSString *details;
-(void)setData:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
