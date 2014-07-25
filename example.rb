require 'rcqrs'
require 'pry'
require 'pry-nav'
require './aggregate_roots'
require './command_handlers'
require './commands'
require './domain_events'

router = Bus::CommandRouter.new
storage = EventStore::Adapters::ActiveRecordAdapter.new(:adapter => 'sqlite3', :database => 'event_source')
repository = EventStore::DomainRepository.new(storage)
command_bus = Bus::CommandBus.new(router, repository)

command = CreateNoteCommand.new('hello', 'world!')
command_bus.dispatch(command)

a = EventStore::Adapters::EventProvider.first

command = PublishNoteCommand.new(a.aggregate_id)
command_bus.dispatch(command)

p repository.find(a.aggregate_id)