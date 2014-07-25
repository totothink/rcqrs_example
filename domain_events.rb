class NoteCreatedEvent < Events::DomainEvent
  attr_reader :guid, :title, :content
  
  initializer :guid, :title, :content
end

class NotePublishedEvent < Events::DomainEvent
  attr_reader :guid, :status
  initializer :guid, :status
end