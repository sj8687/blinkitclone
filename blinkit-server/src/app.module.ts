import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { UserModule } from './user/user.module';
import { MongooseModule } from '@nestjs/mongoose';
import { ConfigModule } from '@nestjs/config';
import { jwtConstants } from './auth/constants';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [
      AuthModule, 
      UserModule,
      ConfigModule.forRoot(),
      MongooseModule.forRoot(`${process.env.NODE_ENV == "development" ? "mongodb://localhost:27017/blinkit" : process.env.DATABASE_URL}`),
      JwtModule.register({
          global: true,
          secret: jwtConstants.secret,
          signOptions: { expiresIn: process.env.NODE_ENV == "development" ? '10d' : Number(process.env.JWT_EXPIRES_IN)},
      })],
      
      
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
