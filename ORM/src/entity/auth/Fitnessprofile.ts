import { Entity, Column, ManyToMany, JoinTable, ManyToOne, JoinColumn, PrimaryGeneratedColumn } from 'typeorm';
import { Role } from './Role';

/**
 * This entity contains the profile information for a user that is not login related.
 * All login related information is stored in the supabase builtin table 'auth.users'
 * which this entity is related to. The constraint to that table cannot be made through typeorm
 * since it is in another schema but it is created through an sql script (SQL/constraints/profile-constraint.sql)
 * which is executed after running the 'npm run sync' command
 */
@Entity()
export class Fitnessprofile {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  username: string;

  @Column()
  gender: string;

  @Column()
  age: number;

  @Column()
  height: number;

  @Column()
  weight: number;

  @ManyToMany(() => Role, { cascade: ['insert', 'update'] })
  @JoinTable({
    name: 'fitnessprofile_role_junction',
    joinColumn: {
      name: 'profile_fk',
    },
    inverseJoinColumn: {
      name: 'role_fk',
    },
  })
  roles: Role[];
}
