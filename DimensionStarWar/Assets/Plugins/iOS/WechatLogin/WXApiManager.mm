//
//  WXApiManager.m
//  Unity-iPhone
//
//  Created by anda on 2019/1/31.
//

#import "WXApiManager.h"

@implementation WXApiManager


+(instancetype) shaderManager
{
    static dispatch_once_t onceToken;
    static WXApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WXApiManager alloc] init];
    });
    return instance;
}

-(void) onReq:(BaseReq *)req {}


-(void) onResp:(BaseResp *)resp
{
    if([resp isKindOfClass:[SendAuthResp class]])
    {
        SendAuthResp *temp = (SendAuthResp*)resp;
        int errorCode = temp.errCode;
        switch (errorCode) {
            case 0:
            {
                printf("登录成功-xcode");
                //UnitySendMessage("[_WechatHelper]", "LoginSuccess", [NSUTF8StringEncoding temp.code]);
                break;
            }
            case -2:
                printf("用户取消");
               // UnitySendMessage("[_WechatHelper]", "LoginFail", "用户取消");
                break;
            case -4:
                printf("用户拒绝授权");
                //UnitySendMessage("[_WechatHelper]", "LoginFail", "用户拒绝授权");
                break;
            default:
                printf("登录失败");
               // UnitySendMessage("[_WechatHelper]", "LoginFail", "登录失败");
                break;
        }
    }
}

@end
