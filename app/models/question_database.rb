# QuestionDatabase
class QuestionDatabase < ActiveRecord::Base
  include Activity
  belongs_to :question_type
  has_many :options

  # validates :question, presence: true, length: \
  # { minimum: 1, maximum: 50 }

  # validates :question_type_id, presence: true
  # validates :no_of_option, presence: true

  def self.create_que(options, que, answer)
    options.each_pair do|k, v|
      if answer.include? k
        ans = true
      else
        ans = false
      end
      Option.create(question_database_id: que.id, option: v, is_answer: ans)
    end
  end
end
