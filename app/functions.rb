# This creates the database (if it doesn't already exist).
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => (ENV['RACK_ENV'] == "test") ? "travelblog.test" : "travelblog"
)

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'visits'
    create_table :visits do |table|
      table.column :country, :string
      table.column :image, :string
      table.column :article_h, :string
      table.column :article_b, :string
      table.column :wiki_h, :string
      table.column :article_b, :string
    end
  end
  
  unless ActiveRecord::Base.connection.tables.include? 'comments'
    create_table :comments do |table|
      table.column :visit_id, :integer
      table.column :name, :string
      table.column :comment, :string
    end
  end
end

class Visit < ActiveRecord::Base
  # name - string
  # description - string
  
  has_many :comments
  # 1. There is a table called "comments".
  # 2. That table has a foreign_key that refers to this table.
  # 3. That foreign_key is called "visit_id".
  # 4. There may be many rows in that table that refer to one row in this table.
  
  # Now...
  # @user.friends returns an Array of Friend objects.
end

class Comment < ActiveRecord::Base
  belongs_to :visits
  # 1. There is a table called "visits".
  # 2. That table has a field called "id".
  # 3. The "visit_id" of this table's row matches some "id" in "visits".
  
  # Now...
  # @friend.user returns a single User object.
end