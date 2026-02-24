import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { MongooseModule } from '@nestjs/mongoose';
import { UserSchema, UserSchemaModel } from './schema/user.schema';

@Module({
  imports:[MongooseModule.forFeature([
      { name: UserSchemaModel.name, schema: UserSchema },
    ]),],
  providers: [UserService],
  exports: [UserService]
})
export class UserModule {}
