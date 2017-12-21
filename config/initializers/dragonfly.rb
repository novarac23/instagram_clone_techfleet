require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "27180cf85d4aad98fb9065f59756b20beca84ea5fa5a7b217af4f2b5c12f4dc6"

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name: 'instagramclonetechfleet',
    access_key_id: 'AKIAJZ7ID7RGSRWSIUWQ',
    secret_access_key: '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'
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
