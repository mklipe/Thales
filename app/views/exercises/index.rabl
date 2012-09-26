collection @exercises, object_root: false

attributes :id, :title, :content

child(:questions) do
attributes :id, :title, :content

node :last_answer, if: lambda {|question| question.last_answers.by_user(current_user).size > 0} do |question|
  la = question.last_answers.by_user(current_user).first
  {
	 tip: la.answer.tip,
	 correct: la.answer.correct,
	 response: la.answer.response,
	 try_number: la.answer.try_number,
	 id: la.id,
  }
end
end

node(:private_pub) { |exercise| PrivatePub.subscription(:channel => "/exercises/#{exercise.id}") }