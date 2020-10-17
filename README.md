### Ugatu-anketa

(https://ugatu-anketa.herokuapp.com)  

Веб-сайт для проведения анонимного анкетирования студентов на тему «Преподаватель глазами студента».
![Статистика 1](.readme-images/3.png)

**[Описание интерфейса;](interface.md)**

**REST API (json):**
  - Возвращение списка (*index*) и сущности (*show*) для:
    - Факультет (*controllers/api/v1/faculties_controller.rb*);
    - Кафедра (*controllers/api/v1/departments_controller.rb*);
    - Преподаватель (*controllers/api/v1/lecturers_controller.rb*);
    - Группа (*controllers/api/v1/university_groups_controller.rb*);
  - Создание (*create*) для:
    - Анкета (*controllers/api/v1/questionnaires_controller.rb*);
  
**RSpec-тесты**:
- Модели:
  -  Кафедра: *spec/models/department_spec.rb*;
  -  Дисциплина: *spec/models/discipline_spec.rb*;
  -  Факультет: *spec/models/faculty_spec.rb*;
  -  Преподаватель: *spec/models/lecturer_spec.rb*;
  -  Анкета: *spec/models/questionnaire_spec.rb*;
  -  Группа: *spec/models/university_group_spec.rb*;
- Запросы (*spec/requests/\*.rb*);
- Интеграционный - создание факультета (*spec/features/faculties_spec.rb*).   
---
*gems:*
 - active_median: *расчет медианных значений для ActiveRecord;*
 - chartkick: *отрисовка круговых диаграмм;*
 - devise/pundit: *регистрация/аутентификация пользователя, права пользователя;*
 - fast_jsonapi: *для создания API.*
- - -
Ruby 2.7.1; Rails 6.0.3