CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIVIEJMDMHRSA7QDA',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'aditapmedia'
end