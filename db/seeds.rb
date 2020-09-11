# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faculty.destroy_all # 1) Destroys Faculty => and also dependent: 2) Department 3) UniversityGroup

faculty_1 = Faculty.create!(title: 'Факультет информатики и робототехники', abbreviation: 'ФИРТ')
faculty_2 = Faculty.create!(title: 'Общенаучный факультет', abbreviation: 'ОНФ')
faculty_3 = Faculty.create!(title: 'Институт авиационных технологий и материалов', abbreviation: 'ИАТМ')
# fzchs = Faculty.create(title: 'Факультет защиты в чрезвычайных ситуациях', abbreviation: 'ФЗЧС')
# inek = Faculty.create(title: 'Институт экономики и управления', abbreviation: 'ИНЭК')
# fadet = Faculty.create(title: 'Факультет авиационных двигателей, энергетики и транспорта', abbreviation: 'ФАДЭТ')
# faviet = Faculty.create(title: 'Факультет авионики, энергетики и инфокоммуникаций', abbreviation: 'ФАВИЭТ')
# ivto = Faculty.create(title: 'Институт военно-технического образования', abbreviation: 'ИВТО')

department_1 = Department.create!(title: 'Вычислительной математики и кибернетики', abbreviation: 'ВМиК', faculty: faculty_1)
department_2  = Department.create!(title: 'Автоматизированных систем управления', abbreviation: 'АСУ', faculty: faculty_1)
department_3  =  Department.create!(title: 'Математики', abbreviation: 'М', faculty: faculty_2)
department_4 = Department.create!(title: 'Общей химии', abbreviation: 'ОХ', faculty: faculty_2)
department_5  = Department.create!(title: 'Материаловедения и физики металлов', abbreviation: 'МиФМ', faculty: faculty_3)
department_6  = Department.create!(title: 'Автоматизации технологических процессов', abbreviation: 'АТП', faculty: faculty_3)

group_1 = UniversityGroup.create!(title: 'БИБ-104', department: department_1, faculty: faculty_1)
group_2 = UniversityGroup.create!(title: 'РБП-208М', department: department_2, faculty: faculty_1)
group_3 = UniversityGroup.create!(title: 'ПМ-101', department: department_3, faculty: faculty_2)
group_4 = UniversityGroup.create!(title: 'Х-301', department: department_4, faculty: faculty_2)
group_5 = UniversityGroup.create!(title: 'АД-215', department: department_5, faculty: faculty_3)
group_6 = UniversityGroup.create!(title: 'АТП-201', department: department_6, faculty: faculty_3)

lecturer_1 = Lecturer.create!(fullname: 'Бронштейн Ефим Михайлович')
lecturer_2 = Lecturer.create!(fullname: 'Ионис Анна Григорьевна')
lecturer_3 = Lecturer.create!(fullname: 'Сулейманова Алла Маратовна')
lecturer_4 = Lecturer.create!(fullname: 'Арьков Валентин Юльевич')
lecturer_5 = Lecturer.create!(fullname: 'Булгакова Гузель Талгатовна')
lecturer_6 = Lecturer.create!(fullname: 'Водопьянов Владимир Васильевич')
lecturer_7 = Lecturer.create!(fullname: 'Давлетов Финат Ильшатович')
lecturer_8 = Lecturer.create!(fullname: 'Пантелеев Никита Анатольевич')
lecturer_9 = Lecturer.create!(fullname: 'Данилов Анатолий Владимирович')
lecturer_10 = Lecturer.create!(fullname: 'Гладышев Никита Андреевич')
lecturer_11 = Lecturer.create!(fullname: 'Михайлов Артем Артемович')
lecturer_12 = Lecturer.create!(fullname: 'Идрисов Ленар Маратович')

discipline_1 = Discipline.create!(title: 'Программирование')
discipline_2 = Discipline.create!(title: 'Базы данных')
discipline_3 = Discipline.create!(title: 'Дискретная математика')
discipline_4 = Discipline.create!(title: 'Коммерческие ИС')
discipline_5 = Discipline.create!(title: 'Алгебра')
discipline_6 = Discipline.create!(title: 'Дифференциальные уравнения')
discipline_7 = Discipline.create!(title: 'Интегральное исчисление')
discipline_8 = Discipline.create!(title: 'Неорганическая химия')
discipline_9 = Discipline.create!(title: 'Органическая химия')
discipline_10 = Discipline.create!(title: 'Гидрология')
discipline_11 = Discipline.create!(title: 'Детали машин')
discipline_12 = Discipline.create!(title: 'Сопротивление материалов')
discipline_13 = Discipline.create!(title: 'Газогидродинамика')
discipline_14 = Discipline.create!(title: 'Инженерная графика')












