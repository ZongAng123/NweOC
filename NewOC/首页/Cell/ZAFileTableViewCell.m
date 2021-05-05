//
//  ZAFileTableViewCell.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/5.
//

#import "ZAFileTableViewCell.h"
#import "NewModel.h"

@interface ZAFileTableViewCell (){
    ZABaseLabel *titleLabel;
    ZABaseLabel *textLabel;
    ZABaseLabel *timeLabel;
}


@end

@implementation ZAFileTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.backgroundColor=[UIColor clearColor];
        
        UIView *backWhiteView=[[UIView alloc]init];
        [self.contentView addSubview:backWhiteView];
        [backWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).with.offset(5);
            make.right.mas_equalTo(self.contentView).with.offset(-5);
            make.top.mas_equalTo(self.contentView).with.offset(10);
            make.bottom.mas_equalTo(self.contentView).with.offset(0);
        }];
        backWhiteView.backgroundColor=[UIColor whiteColor];
        backWhiteView.layer.cornerRadius = 3;
        
        _zaImageview = [UIImageView new];
        [backWhiteView addSubview:_zaImageview];
        [_zaImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(backWhiteView).with.offset(5);
            make.top.mas_equalTo(backWhiteView).with.offset(8);
            make.height.mas_equalTo(130);
            make.width.mas_equalTo(130);
        }];
//        _zaImageview.backgroundColor =[UIColor redColor];
        
        titleLabel = [[ZABaseLabel alloc]init];
        [backWhiteView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_zaImageview.mas_right).with.offset(10);
            make.right.mas_equalTo(backWhiteView).with.offset(-10);
            make.top.mas_equalTo(backWhiteView).with.offset(5);
//            make.height.mas_equalTo(15);
        }];
//        titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        titleLabel.numberOfLines = 0;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        
        timeLabel = [[ZABaseLabel alloc]init];
        [backWhiteView addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(backWhiteView).with.offset(10);
            make.right.mas_equalTo(backWhiteView).with.offset(-10);
            make.bottom.mas_equalTo(backWhiteView).with.offset(-5);
            make.height.mas_equalTo(15);
        }];
        timeLabel.textColor = [UIColor blueColor];
        timeLabel.font = [UIFont systemFontOfSize:12];
        
        textLabel = [[ZABaseLabel alloc]init];
        [backWhiteView addSubview:textLabel];
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(backWhiteView).with.offset(10);
            make.right.mas_equalTo(backWhiteView).with.offset(-10);
            make.top.mas_equalTo(titleLabel.mas_bottom).with.offset(5);
            make.bottom.mas_equalTo(timeLabel.mas_top).with.offset(-5);
        }];
        textLabel.textColor = [UIColor blueColor];
        textLabel.font = [UIFont systemFontOfSize:13];
        textLabel.numberOfLines = 2;
        

        

        
//        UIImageView *lineImage=[[UIImageView alloc]init];
//        [self.contentView addSubview:lineImage];
//        [lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.mas_equalTo(self.contentView);
//            make.bottom.mas_equalTo(self.contentView);
//            make.height.mas_equalTo(1);
//        }];
//        lineImage.backgroundColor=mRGB(238, 238, 238);
    }
    
    return self;
}
- (void)setObject:(id)object{
    NewModel *FileMode = object;
    
    titleLabel.text = FileMode.title; //
    textLabel.text = FileMode.xinFangEvent; //
    [ZAPublicFunction xiugailabel:textLabel jianju:5];
    timeLabel.text = FileMode.xinFangTime; //
    
    [_zaImageview sd_setImageWithURL:[NSURL URLWithString:FileMode.headpic] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    
   
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
