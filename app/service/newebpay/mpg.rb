module Newebpay
  class Mpg
    attr_accessor :info

    def initialize(params)
      @key = "l07y6w7gycxxjYchmd8A4Kshq7GnUiuH" # ENV["newebpay_key"]
      @iv = "P2qqgQgqFrVyYzzC" # ENV["newebpay_iv"]
      @merchant_id = "MS1603090558" # ENV["merchant_id"]
      @info = {} #使用attr_accessor
      set_info(params)
    end

    def form_info
      {
        MerchatID: @merchant_id,
        TradeInfo: trade_info,
        TradeSha: trade_sha,
        Version: "2.0"
      }
    end

    private
    
    def set_info   # (order)
      #必填欄位
      info[:MerchatID] = @merchant_id #商店代號
      info[:ResponType] = "JSON" #回傳格式
      info[:TimeStamp] = Time.now.to_i.to_s #時間戳記
      info[:version] = "2.0" #串接版本
      info[:MerchantOderNo] = "123" #order.slug #訂單編號
      info[:Amt] = "200" #order.price #訂單金額
      info[:ItemDesc] = "第一次串接就成功" #order.name #商品資訊,編碼為utf-8格式
      info[:LoginType] = 0 #是否需要藍新會員
      
      #選填欄位
      info[:ReturnURL] = " " #支付完成返回商店網址 Form Post方式回傳
      info[:NotifyURL] = " " #支付通知網址：幕後方式回傳給商店支付結果資料
      info[:email] = " " #order.email
      info[:CREDIT] = 1
      info[:TradeLimit] = 300 #交易秒數限制:上限900秒
    end
    
    def trade_info 
      # AES256 加密後資訊
      aes_encode(url_encoded_query_string)
    end

    def trade_sha
      # SHA256 加密後資訊
      sha256_encode(@key, @iv, trade_info)
    end



    def url_encoded_query_string
      URI.encode_www_form(info)  #將加密後的內容轉為 query string
    end

    def aes_encode(string)
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypted_password #cipher.encrypted
      cipher.key = @key
      cipher.iv = @iv
      cipher.padding = 0
      padding_data = add_padding(string)
      encrypted = cipher.update(padding_data) + cipher.final
      encrypted.unpack('H*').first
    end

    def add_padding(data, block_size = 32)
      pad = block_size - (data.length % block_size)
      data + (pad.chr * pad)
    end



    def sha256_encode(key, iv, trade_info)
      encode_string = "HashKey=#{key}&#{trade_info}&HashIV=#{iv}"
      Digest::SHA256.hexdigest(encode_string).upcase
    end


  end
end