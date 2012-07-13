#encoding:utf-8
module ApplicationHelper
  def questions(exercise)
    questions = "<h2> Questões </h2>"
    questions << "<br /><div id='questions'>"
    if exercise.questions.any?
      questions << render(:partial => "questions/question",
                           :collection => exercise.questions)
    end
    questions << "</div>"
    raw questions
  end

  def new_question(exercise)
    raw render(:partial => "questions/new_question",
               :locals => { :model => exercise})
  end
end
