#[
  #Employee,
  #Position,
  #Department,
  #TeamMembership,
  #Team,
  #Note,
  #Task,
  #Milestone
#].each(&:delete_all)

[Role, Scope].each(&:delete_all)
role = Role.create! name: 'admin'
role.scopes.create! name: 'testscope'

##departments = []
#def create_department(name)
  #dept = Department.create! name: name
  #team = dept.teams.create!(name: 'Engineering Team B')
  #team.notes.create!(body: Faker::Lorem.sentence)
  #dept.teams.create!(name: 'Engineering Team C')
  #dept.notes.create!(body: Faker::Lorem.sentence)
  #dept
#end

#departments << create_department('Engineering')
#departments << create_department('Safety')
#departments << create_department('QA')

#100.times do
  #employee = Employee.create! first_name: Faker::Name.first_name,
    #last_name: Faker::Name.last_name,
    #age: rand(20..80)

  #(1..2).each do |i|
    #employee.positions.create! title: Faker::Job.title,
      #historical_index: i,
      #active: i == 1,
      #department: departments.sample
  #end

  #employee.teams << employee.positions[0].department.teams.sample
  #employee.notes.create!(body: Faker::Lorem.sentence)

  #team = employee.teams.first
  #employee.bugs.create!(title: Faker::Lorem.sentence, team: team)
  #employee.features.create!(title: Faker::Lorem.sentence, team: team)
  #epic = employee.epics.create!(title: Faker::Lorem.sentence, team: team)
  #epic.milestones.create!(name: Faker::Lorem.word.titleize)
#end
