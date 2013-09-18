//
//  D1EditPostViewController.h
//  CFPosts
//
//  Created by Brad on 9/11/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1NewViewController.h"
#import "CFPost.h"
#import "D1TimeDataSourceObject.h"
#import "Post.h"


@protocol SaveEditedPostDelegate <NSObject>

-(void)saveEditedPost:(Post *)data OnCell:(NSInteger)cell;
-(void)deletePost:(Post *)post WithCellNumber:(NSInteger)cell;


@end

@interface D1EditPostViewController : D1NewViewController

@property (nonatomic,assign) id<SaveEditedPostDelegate> delegate;




@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong,nonatomic) Post *editPost;
@property (nonatomic) NSInteger collectionCellNumber;





-(void)receivePostData:(Post *)myData;

@end
