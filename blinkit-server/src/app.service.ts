import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getSystemStatus(): string {
    return 'System is Healthy';
    
  }
}
