module ApplicationHelper

  def human_talent_type(talent)
    {
      "Designer" => "I am a designer.",
      "Developer" => "I am a developer.",
      "Both" => "I am both a designer and a developer.",
      "Other" => "I am not a designer or a developer but I have other useful skills."
    }[talent]
  end
end
