Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV '268940727421055', ENV'207ba640b98c3ac26142c8523cdb4108'
  end