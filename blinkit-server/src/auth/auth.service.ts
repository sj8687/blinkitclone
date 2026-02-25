import { Injectable, Req } from '@nestjs/common';
import { UserService } from 'src/user/user.service';
import { UserDto } from './DTO/user.dto';

@Injectable()
export class AuthService {
   constructor(private readonly UserService: UserService) {}
    signupUser(UserDto:UserDto) {
        return this.UserService.createUser(UserDto);
    };
    signinUser(UserDto:UserDto) {
        return this.UserService.signin(UserDto);
    };
}
