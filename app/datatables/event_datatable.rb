class EventDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :link_to, :event_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end


  def view_columns
    @view_columns ||= {
      event_name:         { source: 'Event.event_name', cond: :like, orderable: true },
      event_description:  { source: 'Event.event_description', cond: :like, orderable: true },
      event_time:         { source: 'Event.event_time', cond: :like, orderable: true },
      creator:            { source: 'Event.creator', cond: :like, orderable: false },
      sign_ups:           { source: 'Event.sign_ups', orderable: false  },
      show:               { source: 'Event.id' },
      delete:             { source: 'Event.id '}
    }
  end

  def data
    records.map do |record|
      {
        event_name:        record.event_name,
        event_description: record.event_description,
        event_time:        record.event_time.strftime("%B %d, %Y (%I:%M %p)"), 
        creator:           record.user.full_name,
        sign_ups:     0,
        show:              show(record),
        delete:              delete(record),
        DT_RowId:          record.id
      }
    end
  end

  def show(event)
    link_to('Show', event_path(event))
  end

  def delete(event)
    link_to('Delete', event_path(event),  data: { "turbo-method": :delete, confirm: 'Are you sure?'})
  end

  def get_raw_records
    Event.all.where(flagged: true)
  end

end
