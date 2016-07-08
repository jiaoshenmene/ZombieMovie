//
//  GGMessageVC.m
//  ZombieMovie
//
//  Created by dujia on 16/7/7.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMessageVC.h"
#import "GGMessageView.h"




@interface GGMessageVC()<GGMessageViewDelegate>
@property (nonatomic , strong) GGMessageView *messageView;




/*!
 @property
 @brief 聊天的会话对象
 */
@property (strong, nonatomic) EMConversation *conversation;


/*!
 @property
 @brief 加载的每页message的条数
 */
@property (nonatomic) NSInteger messageCountOfPage; //default 50


@end

@implementation GGMessageVC

- (instancetype)initWithConversationChatter:(NSString *)conversationChatter
                           conversationType:(EMConversationType)conversationType
{
    if (![conversationChatter isStringSafe]) {
        return nil;
    }
    
    if (self = [super init]) {
        _conversation = [[EMClient sharedClient].chatManager getConversation:conversationChatter type:conversationType createIfNotExist:YES];
        
        [_conversation markAllMessagesAsRead];
        
        
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _messageView = [[GGMessageView alloc] initWithFrame:self.view.bounds];
    _messageView.delegate = self;
    [self.view addSubview:_messageView];
    
  
    
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}





- (void) sendMethod:(id)sender
{
    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:@"要发送的消息"];
    NSString *from = [[EMClient sharedClient] currentUsername];
    
    NSString *to = @"dujia10";
    //生成Message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:to
                                                              from:from
                                                                to:to
                                                              body:body ext:nil];
    NSLog(@"from = %@ , self.conversation.conversationId = %@",from,to);
    message.chatType = EMChatTypeChat;// 设置为单聊消息
    [[EMClient sharedClient].chatManager asyncSendMessage:message progress:nil completion:^(EMMessage *message, EMError *error) {
        NSLog(@"yes");
    }];
   
}
@end
