import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { UserModule } from './user/user.module';
import { MongooseModule } from '@nestjs/mongoose';
import { ConfigModule } from '@nestjs/config';
import { jwtConstants } from './auth/constants';
import { JwtModule } from '@nestjs/jwt';
import { ThrottlerGuard, ThrottlerModule } from '@nestjs/throttler';
import { APP_GUARD } from '@nestjs/core';
import { CartModule } from './cart/cart.module';

@Module({
    imports: [
        AuthModule,
        UserModule,
        CartModule,
        ConfigModule.forRoot(),
        MongooseModule.forRoot(`${process.env.NODE_ENV == "development" ? "mongodb://localhost:27017/blinkit" : process.env.DATABASE_URL}`),
        JwtModule.register({
            global: true,
            secret: jwtConstants.secret,
            signOptions: { expiresIn: process.env.NODE_ENV == "development" ? '10d' : Number(process.env.JWT_EXPIRES_IN) },
        }),
        ThrottlerModule.forRoot([
            {
                name: 'short',
                ttl: 1000, 
                limit: 3, 
            },
            {
                name: 'medium',
                ttl: 10000,
                limit: 20
            },
            {
                name: 'long',
                ttl: 60000,
                limit: 100
            }
        ]),
        CartModule,
    ],

    controllers: [AppController],

    providers: [
        AppService,
        {
            provide: APP_GUARD,
            useClass: ThrottlerGuard,
        },
    ],
})
export class AppModule { }
