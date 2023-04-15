class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegators :@view, :link_to, :user_path, :users_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end


  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      first_name:   { source: 'User.first_name', cond: :like, orderable: true },
      last_name:    { source: 'User.last_name', cond: :like, orderable: true },
      email:        { source: 'User.email', cond: :like, orderable: true },
      created_at:   { source: 'User.created_at', cond: :like, orderable: true },
      active:       { source: 'User.active' },
      edit:         { source: 'User.id' }
    }
  end

  def data
    records.map do |record|
      {
        first_name:   record.first_name,
        last_name:    record.last_name,
        email:        record.email, 
        created_at:   record.created_at,
        active:       record.active ? 'Yes' : 'No',
        edit:         edit(record),
        DT_RowId:     record.id
      }
    end
  end

  def edit(user)
    link_to('Show', user_path(user))
  end

  def get_raw_records
    # insert query here
    User.all
  end

end
