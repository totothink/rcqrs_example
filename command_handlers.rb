class CreateNoteHandler < Commands::Handlers::BaseHandler
  def execute(command)
    note = Domain::Note.create(command.title, command.content)
    @repository.save(note)
  end
end

class PublishNoteHandler < Commands::Handlers::BaseHandler
  def execute(command)
    note =@repository.find(command.note_id)
    note.publish
    @repository.save(note)
  end
end