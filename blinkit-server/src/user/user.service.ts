import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import bcrypt from "bcrypt";
import { Model } from 'mongoose';
import { SignupDto } from 'src/auth/DTO/signup.dto';
import { UserSchemaModel } from './schema/user.schema';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class UserService {
    constructor(@InjectModel(UserSchemaModel.name) private userModel: Model<UserSchemaModel>,public jwtService: JwtService) { }
    async createUser(SignupDto: SignupDto) {
        try {
            const existingUser = await this.userModel.findOne({
                email: SignupDto.email,
            });

            if (existingUser) {
                const payload = { sub: existingUser.id, email: existingUser.email };
                const Token = await this.jwtService.signAsync(payload);
                return {
                    id: existingUser._id,
                    email: existingUser.email,
                    statusCode: 200,
                    Token
                }
            }

            const hashedPassword = await bcrypt.hash(SignupDto.password, 10);

            const user = await this.userModel.create({
                email: SignupDto.email,
                password: hashedPassword,
            });
            return {
                id: user._id,
                email: user.email,
                statusCode: 201
            };
            
        } catch (error) {
            throw new InternalServerErrorException(
                'Something went wrong while creating user',
            );
        }
    }
    
    async signin(SignupDto: SignupDto){
        // create a signin feat here
    }
}



