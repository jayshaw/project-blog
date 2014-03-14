# This creates the database (if it doesn't already exist).
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => (ENV['RACK_ENV'] == "test") ? "travelblog.test" : "travelblog"
)

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'visits'
    create_table :visits do |table|
      table.column :name, :string
      table.column :description, :string
    end
  end
  
  unless ActiveRecord::Base.connection.tables.include? 'comments'
    create_table :comments do |table|
      table.column :user_id, :integer
      table.column :name, :string
    end
  end
end

class Visits < ActiveRecord::Base
  # name - string
  # description - string
  
  has_many :comments
  # 1. There is a table called "friends".
  # 2. That table has a foreign_key that refers to this table.
  # 3. That foreign_key is called "this_table_singular_id". ("user_id")
  # 4. There may be many rows in that table that refer to one row in this table.
  
  # Now...
  # @user.friends returns an Array of Friend objects.
end