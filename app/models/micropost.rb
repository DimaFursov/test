class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  #по столбцу created_at order('created_at DESC')

=begin
    функция, созданная без названия
  >> -> { puts "foo" }
=> #<Proc:0x007fab938d0108@(irb):1 (lambda)>
>> -> { puts "foo" }.call
foo
=> nil
=end
  mount_uploader :picture, PictureUploader  
  validates :user_id, presence: true  
  validates :content, presence: true, length: { maximum: 140 }
end
