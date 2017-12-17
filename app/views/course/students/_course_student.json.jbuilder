json.extract! course_student, :id, :first_name, :last_name, :dni, :number, :email, :created_at, :updated_at
json.url course_student_url(course_student, format: :json)
