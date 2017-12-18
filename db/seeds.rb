# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in (1..4)
    valor = "A#{i}"
    Classroom.create(name: valor)
end

Department.create(name: "Sistemas y Computación", abbrev: "Sis y Comp", apartment_manager: "Ing. Nuñez Ayala Abel")
Department.create(name: "Ciencias Basicas", abbrev: "C. Basicas", apartment_manager: "Ing. Lorem Ipsum")

# contract 1 = honorario : 0 = plaza
Article.create(name: "Proyector 1", details: "A2YT3U2Y4I", description: "proyecto comun y corriente")
Article.create(name: "Proyector 2", details: "BH102UANS9Q", description: "otro mas comun")
Article.create(name: "Proyector 3" , details: "CUQY284JWS", description: "el casi ultimo")
Article.create(name: "Proyector 4", details: "873GHDSJAQ", description: "este es el ultimo")

Teacher.create(code: 1, name: "Juan José",  surnames: "García Gonzalo",     contract: true, department_id: 1)
Teacher.create(code: 2, name: "Luis",       surnames: "Ávila Camacho",      contract: false, department_id: 2)
Teacher.create(code: 3, name: "Margarita",  surnames: "Conzuelo Vivian",    contract: false, department_id: 1)
Teacher.create(code: 4,	name: "Veronica",   surnames: "Azcally Zu",         contract: true, department_id: 2)

#=begin
(5..15).each do |t|
    Teacher.create( code: t, name: (Faker::Name.name), surnames: (Faker::Name.last_name), contract: (Faker::Boolean.boolean), department_id: (Faker::Number.between(1, 8))) #, created_at: Faker::Date.between(Date.today, 2.year.ago) )
    Article.create(name: "Proyector #{t}", details: "AAAAAAAA", description: "lorem ipsum", created_at: Faker::Date.between(Date.today, 2.year.ago))
    Classroom.create(name: "A#{t}", created_at: Faker::Date.between(Date.today, 2.year.ago))
end
=begin
(1..15).each do |t|
    Registry.create(article_id: t, user_id: 1, teacher_id: t, classroom_id: t, status: false, created_at: Faker::Time.forward( Faker::Number.between(1, 365), :all ) )
end
=end
