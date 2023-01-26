import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Exercises {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column('text')
  desc: string;

  @Column()
  category: string;

}
