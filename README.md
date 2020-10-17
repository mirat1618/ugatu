### Ugatu-anketa

(https://ugatu-anketa.herokuapp.com)  

Веб-сайт для проведения анонимного анкетирования студентов на тему «Преподаватель глазами студента».
![Статистика 1](.readme-images/3.png)
- **[Описание интерфейса;](interface.md)**
- **REST API:**
  - vjkt
  
RSpec тесты:
>  - Модели:
>    -  Кафедра: *spec/models/department_spec.rb*;
>    -  Дисциплина: *spec/models/discipline_spec.rb*;
>    -  Факультет: *spec/models/faculty_spec.rb*;
>    -  Преподаватель: *spec/models/lecturer_spec.rb*;
>    -  Анкета: *spec/models/questionnaire_spec.rb*;
>    -  Группа: *spec/models/university_group_spec.rb*;
>  - Запросы (*spec/requests/\*.rb*);
>  - Интеграционный - создание факультета (*spec/features/faculties_spec.rb*);   
       


_ _ _
Ruby 2.7.1; Rails 6.0.3