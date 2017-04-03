class Employee < ApplicationRecord
  has_many :positions
  has_many :employee_teams
  has_many :teams, through: :employee_teams
end
