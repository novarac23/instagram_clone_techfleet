class Photo < ApplicationRecord
  dragonfly_accessor :image do
    storage_options do |attachment|
      {
        path: "images/#{rand(100)}",
        headers: {"x-amz-acl" => "public-read-write"}
      }
    end
  end

  belongs_to :user
  has_many :comments
end
