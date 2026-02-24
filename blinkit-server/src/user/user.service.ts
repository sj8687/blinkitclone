import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { SignupDto } from 'src/auth/DTO/signup.dto';
import { UserDocument, UserSchemaModel } from './schema/user.schema';
import { Model } from 'mongoose';

@Injectable()
export class UserService {
    constructor(@InjectModel(UserSchemaModel.name) private userModel: Model<UserSchemaModel>) {}
    createUser(SignupDto: SignupDto) {
        const user =new this.userModel(SignupDto);
        return user.save();
    }
}
