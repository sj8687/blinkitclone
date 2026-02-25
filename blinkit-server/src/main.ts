import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import cookieParser from 'cookie-parser';
import { ValidationPipe } from '@nestjs/common';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.use(cookieParser());

  process.env.NODE_ENV == "development" ?
  app.enableCors()
        :
  app.enableCors({
    origin: `${process.env.APP_URL}`,
    credentials: true,
  });

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,       
      forbidNonWhitelisted: true, 
      transform: true         
    })
  );
  
  await app.listen(process.env.PORT ?? 3000);
  
}
bootstrap();
