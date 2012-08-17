collection @questions, object_root: false
attributes :id, :title, :content

node :last_answer, if: lambda {|question| question.last_answers.size > 0} do |question|
  answer = question.last_answers.first.answer;
  {
	 tip: answer.tip,
	 correct: answer.correct,
	 response: answer.response,
	 try_number: answer.try_number,
  }
end
