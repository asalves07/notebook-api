class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "André Alves"
  end
  
  def as_json(options={})
    super( methods: :author, root: true)
  end

end
