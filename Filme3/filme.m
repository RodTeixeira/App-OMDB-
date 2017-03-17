//
//  filme.m
//  Filme3
//
//  Created by Rodolfo Teixeira on 10/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import "filme.h"

@implementation filme
//(title) recebe o json(Title) fornecido pelo serviso 
-(instancetype)initWithData:(NSDictionary *)json{
    self =[super init];
    if (self) {
    
        _title = json[@"Title"];
        _year = json [@"Year"];
        _released= json [@"Released"];
        _runtime = json [@"Runtime"];
        _genre = json [@"Genre"];
        _actors = json [@"Actors"];
        _plot = json [@"Plot"];
        _imdbID =json [@"imdbID"];
        _poster=json[@"Poster"];
        _imageBack=json[@"Poster"];
        _backUrl=[NSURL URLWithString:_imageBack];
        _posterUrl=[NSURL URLWithString:_poster];
       
    

    }
    
    return self;
    
    
}


@end
