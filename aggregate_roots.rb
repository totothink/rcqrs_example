module Domain
  class Note
    extend AggregateRoot

    attr_reader :title, :content, :status

    def self.create(title, content)
      event = NoteCreatedEvent.new(guid: Rcqrs::Guid.create, title: title, content: content)
      create_from_event(event)
    end

    def publish
      event = NotePublishedEvent.new(status: 'published')
      apply(event)
    end

    private
    def on_note_created(event)
      @guid = event.guid
      @title = event.title
      @content = event.content
    end

    def on_note_published(event)
      @status = event.status
    end
  end
end
