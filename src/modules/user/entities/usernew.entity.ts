import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';
import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
@Entity('users')
export class User {
  @Field(() => ID)
  @PrimaryGeneratedColumn('increment')
  user_id: number;

  @Field()
  @Column({ unique: true, length: 255 })
  email: string;

  @Column({ length: 255 })
  password: string;

  @Field()
  @Column({ length: 100 })
  first_name: string;

  @Field()
  @Column({ length: 100 })
  last_name: string;

  @Field({ nullable: true })
  @Column({ nullable: true })
  office_id?: number;

  @Field()
  @Column({ length: 20, default: 'active' })
  status: string;

  @Field({ nullable: true })
  @Column({ length: 500, nullable: true })
  profile_picture_url?: string;

  @Field()
  @CreateDateColumn()
  created_at: Date;

  @Field()
  @UpdateDateColumn()
  updated_at: Date;
}
