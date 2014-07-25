class CreateNoteCommand
  extend Commands::ActiveModel

  attr_reader :title, :content
  validates_presence_of :title, :content

  initializer :title, :content  
end

class PublishNoteCommand
  extend Commands::ActiveModel

  attr_reader :note_id
  validates_presence_of :note_id

  initializer :note_id
end