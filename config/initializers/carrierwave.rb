CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["lDbFzfFhBXIAMlrU_B0Noxf1fk3wWILGo5ZNOwxC"]
  config.qiniu_secret_key    = ENV["ZoF0r6Q71ChAbwZIgEJh2ZMCmVCRl9Rtfo1Sjylu"]
  config.qiniu_bucket        = ENV["dog-book"]
  config.qiniu_bucket_domain = ENV["oqcq4n1q1.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
