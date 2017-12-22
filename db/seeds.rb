Course.create(year: 2017)
Course.create(year: 2016)

Course.all.each do |course|
  rand(10..15).times do |i|
    name = Faker::RickAndMorty.character.split(/\W+/)
    if name.size == 1
      name.push Faker::RickAndMorty.character.split(/\W+/).first
    end
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
    date = Time.zone.today.change(year: course.year) + i.days
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