# interview-kreddo

## Description of this project

This project is created with Laravel framework (PHP). The structure of the `tasks` table is as follows:

| Column      | Type                                         |
| ----------- | -------------------------------------------- |
| id          | unsigned bigint                              |
| title       | varchar                                      |
| description | longtext                                     |
| priority    | enum ('low', 'medium', 'high')               |
| status      | enum ('pending', 'in-progress', 'completed') |
| expired_at  | timestamp                                    |
| created_at  | timestamp                                    |
| updated_at  | timestamp                                    |
