import { Injectable, Req } from '@nestjs/common';
import { UserService } from 'src/user/user.service';
import { SignupDto } from './DTO/signup.dto';

@Injectable()
export class AuthService {
   constructor(private readonly UserService: UserService) {}
    signupUser(SignupDto:SignupDto) {
        return this.UserService.createUser(SignupDto);
    };
}
