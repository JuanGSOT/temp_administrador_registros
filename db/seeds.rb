# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..4
    valor = "A#{i}"
    Classroom.create(name: valor)
end

Teacher.create(code: 1, name: "Juan Jose", surnames: "Garcia Gonzalo", contract: 1, status:	0)
Teacher.create(code: 2, name: "Luis", surnames: "Avila Camacho", contract:	0, status: 0)
Teacher.create(code: 3, name: "Margarita", surnames: "Conzuelo Vivian", contract: 0, status: 0)
Teacher.create(code: 4,	name: "Veronica", surnames: "Azcally Zu", contract: 1, status: 0)

Article.create(name: "proyecto 1", details: "A2YT3U2Y4I", description: "proyecto comun y corriente", status: 0)			
Article.create(name: "Proyector 2", details: "BH102UANS9Q", description: "otro mas comun", status: 0)
Article.create(name: "Proyector 3" , details: "CUQY284JWS", description: "el casi ultimo", status: 0)
Article.create(name: "Proyector 4", details: "873GHDSJAQ", description: "este es el ultimo", status: 0)


Registry.create(article_id: 1, loan: Time.now(), user_id: 1, teacher_id: 1, classroom_id: 1)