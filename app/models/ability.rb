class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'Admin'
      can [:read, :create, :update], :all
    elsif user.role == 'Employee'
      can :read, TimeTable
      can :read, Employee
      can :read, ArchivedEmployee
      can [:read, :create, :update], [ExamGroup, Exam, ExamScore]
    else
      can [:read, :update], Student
      can [:read, :update], ArchivedStudent
      can :read, TimeTable
    end
  end
end
