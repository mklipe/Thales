require 'math_evaluate'
#require File.expand_path("../../../lib/math/math_evaluate", __FILE__)

class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include MathEvaluate
  belongs_to :user
  belongs_to :question
  has_one :last_answer
 
  embeds_many :comments
  accepts_nested_attributes_for :comments
    
  field :response
  field :correct, type: Boolean
  field :tip
  field :user_name
  field :try_number, type: Integer
  field :exercise_id
  
  before_save :verify_response  
  after_save :register_last_answer
  before_save :update_exercise_id
  
  default_scope order_by([:created_at, :desc])

  scope :wrong, lambda { |exer_id| 
    where(correct: false, "exercise_id" => exer_id) 
  }

  scope :by_user, lambda { |user|
    where(:user_id => user.id)
  }
  
  scope :by_user_name, lambda {|searchterm|
    any_of(:user_name => /.*#{searchterm}.*/)
  }
  
  scope :by_question, lambda { |question|
    where(:question_id => question.id)
  }
    
  def verify_response
    question = Question.find(self.question_id) 
    self.correct = MathEvaluate::Expression.eql?(question.correct_answer, self.response)
    if !self.correct
      get_tip
      self.user_name = self.user.name
    else
      @tips_count = self.question.tips_counts.find_or_create_by(:user_id => self.user.id)
      self.try_number = @tips_count.tries
    end 
  end
  
  def get_tip
    self.tip = "Tem algo errado!"
  
    @tips_count = self.question.tips_counts.find_or_create_by(:user_id => self.user.id)
    @tips_count.inc(:tries, 1)
    self.try_number = @tips_count.tries
    
    tip = self.question.tips.where(:number_of_tries.lte => @tips_count.tries).desc(:number_of_tries).first
    
    if tip
      self.tip = tip.content  
    end

  end
  
  def register_last_answer
    @last_answer = self.user.last_answers.find_or_create_by(:question_id => self.question.id)
    @last_answer.set(:answer_id, self.id)
    #@last_answer.save
  end
  
  def update_exercise_id
    self.exercise_id = self.question.exercise_id
  end
    
end
