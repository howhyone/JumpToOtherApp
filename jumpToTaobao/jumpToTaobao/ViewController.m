//
//  ViewController.m
//  jumpToTaobao
//
//  Created by mac on 2018/4/19.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *taobaoOriginStr;
    NSString *tmallOriginStr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)jumpToOtherAPP:(id)sender {
    taobaoOriginStr = @"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w5003-17105905464.3.6dd32251bacIJj&id=560230697174&scene=taobao_shop";
    tmallOriginStr = @"https://detail.tmall.com/item.htm?spm=a222t.7794920.fact.12.487a667cokkYgr&acm=lb-zebra-24139-328483.1003.4.1586955&id=539112762238&scm=1003.4.lb-zebra-24139-328483.OTHER_539112762238_1586955";
//    [self foraward:taobaoOriginStr];
    [self foraward:tmallOriginStr];
}

-(void)foraward:(NSString *)urlStr
{
    if ([urlStr containsString:@"item.taobao.com"])
    {
        NSString *itemId = [urlStr substringWithRange:NSMakeRange([urlStr rangeOfString:@"id"].location + 3, 12)];
        NSString *taobaoStr = [NSString stringWithFormat:@"taobao://item.taobao.com/item.htm?id=%@",itemId];
        NSURL *taobaoUrl = [NSURL URLWithString:taobaoStr];
        if ([[UIApplication sharedApplication] canOpenURL:taobaoUrl]) {
            [[UIApplication sharedApplication] openURL:taobaoUrl];
            return;
        }
        else
        {
            NSURL *taobaoWebUrl = [NSURL URLWithString:urlStr];
            if ([[UIApplication sharedApplication] canOpenURL:taobaoWebUrl]) {
                [[UIApplication sharedApplication] openURL:taobaoWebUrl];
                return;
            }
        }
    }
    else if ([urlStr containsString:@"detail.tmall.com"])
    {
        NSString *itemId = [urlStr substringWithRange:NSMakeRange([urlStr rangeOfString:@"id"].location + 3, 12)];
        NSString *tmallStr = [NSString stringWithFormat:@"tamll://tmallclient/?{\"action\":\"item:id=%@\"}",itemId];
        NSURL *tmallUrl = [NSURL URLWithString:[tmallStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        if ([[UIApplication sharedApplication] canOpenURL:tmallUrl]) {
            [[UIApplication sharedApplication] openURL:tmallUrl];
            return;
        }
        else{
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStr]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
                return;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
