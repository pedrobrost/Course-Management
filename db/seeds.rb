Course.create(title: 'Ruby', year: 2017)
Course.create(title: 'Lenguaje C', year: 2017)

Course.all.each do |course|
  rand(10..15).times do |i|
    name = Faker::RickAndMorty.character.split(/\W+/)
    email = name.first + '@gmail.com'

    Student.create(first_name: name.first,
                    last_name: name.last,
                    email: email,
                    dni: "402895" + rand(10..99).to_s,
                    number: "137#{i}/#{i % 10}",
                    course: course)
  end

  4.times do |i|
    title = "Examen #{i}"
    score = rand(5..10)
    date = Time.zone.today + i.days
    Exam.create(course: course,
                title: title,
                minimum: score,
                date: date)
  end
end

Exam.all.each do |exam|
  students = exam.course.students
  students.sample(rand(7..students.size)).each do |student|
    score = rand(0..15.0).round(2)
    exam.results.build(score: score, student: student)
    exam.save
  end
end

User.create(email: 'admin@gmail.com', password: '123456')