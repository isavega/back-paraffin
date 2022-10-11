# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created
# alongside the database with db:setup).

user1 = User.create(name: 'Isa', email: 'isa@fin.com', password: 'piscola')
user2 = User.create(name: 'Cecy', email: 'cecy@fin.com', password: 'terremoto')
user3 = User.create(name: 'Vane', email: 'vane@fin.com', password: 'gintonic')
fullstack_curriculum = Curriculum.create(name: 'Fullstack Developer', description: 'Very complete curriculum to turn yourself into a complete software developer, with both backend and frontend knowledge, from the basics.')

ruby_learning_unit = LearningUnit.create(name: 'Ruby', description: 'A dynamic, open source programming language with a focus on simplicity and productivity.')
rails_learning_unit = LearningUnit.create(name: 'Rails', description: 'Rails is a full-stack framework. It ships with all the tools needed to build amazing web apps on both the front and back end. Great for starters.')
git_learning_unit = LearningUnit.create(name: 'Git', description: 'Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.')
r_learning_unit = LearningUnit.create(name: 'R', description: 'R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS.')
sql_learning_unit = LearningUnit.create(name: 'SQL', description: 'SQL is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS).')
python_learning_unit = LearningUnit.create(name: 'Python', description: 'Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.')
html_learning_unit = LearningUnit.create(name: 'HTML', description: 'The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser.')
javascript_learning_unit = LearningUnit.create(name: 'JavaScript', description: "Because JavaScript is a great language for coding beginners, we've gathered some of the best learning resources around and built a JavaScript course to help new developers get up and running.")
figma_learning_unit = LearningUnit.create(name: 'Figma', description: 'With Figma, everyone works towards a shared goal. This has enabled our product teams to ship new products faster and feel more confident in their decisions.')


CurriculumAffiliation.create(curriculum: fullstack_curriculum,
                             learning_unit: ruby_learning_unit)
CurriculumAffiliation.create(curriculum: fullstack_curriculum,
                             learning_unit: rails_learning_unit)



f_resource = Resource.create(user: user1, learning_unit: ruby_learning_unit,
                             name: 'Ruby for dummies', url: 'https://www.codecademy.com/learn/learn-ruby',
                             description: 'In this course, you will gain familiarity with Ruby and basic programming concepts—including variables, loops, control flow, and most importantly, object-oriented programming.')
s_resource = Resource.create(user: user2, learning_unit: ruby_learning_unit,
                             name: 'Basic Ruby', url: 'https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby',
                             description: "Time to dive deep into Ruby, the language 'designed for programmer happiness.' You'll cover object-oriented design, testing, and data structures - essential knowledge for learning other programming languages, too!")
ResourceComment.create(user: user2, resource: f_resource,
                       content: 'Very good resource!')
ResourceEvaluation.create(user: user2, resource: f_resource, evaluation: 3)
ResourceEvaluation.create(user: user1, resource: s_resource, evaluation: 1)
CompletedLearningUnit.create(user: user3, learning_unit: ruby_learning_unit)
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end