//
//  filme.h
//  Filme3
//
//  Created by Rodolfo Teixeira on 10/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface filme : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *year;
@property (strong,nonatomic) NSString *released;
@property (strong,nonatomic) NSString *runtime;
@property (strong,nonatomic) NSString *genre;
@property (strong,nonatomic) NSString *actors;
@property (strong,nonatomic) NSString *plot;
@property (strong,nonatomic) NSString *imdbID;
@property (strong,nonatomic) NSString *poster;
@property (strong,nonatomic) NSURL *posterUrl;
@property (strong,nonatomic) NSString *imageBack;
@property (strong,nonatomic) NSURL *backUrl;

-(instancetype)initWithData:(NSDictionary*)json;


@end
