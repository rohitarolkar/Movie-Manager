# To change this template, choose Tools | Templates
# and open the template in the editor.

class RedisData
  def self.redis_con
    @@limit = 14
    @@redis= Redis.new()    
  end

  def self.get_rescent_views(remote_ip)
    key = "remote_ip:" + remote_ip
    trigger = @@redis.HGET(key ,"trigger")
    a = []
    if trigger != nil
      if @@redis.HLEN( key).length > 1
        @@limit.times{
          a << @@redis.HGET( key ,trigger )
          trigger =  trigger == @@limit ? 1 : trigger + 1
        }
      end
    else
      # Just to keep the number of users visited the site even if not browsed
      @@redis.HSETkey( key, "trigger", 0 )
    end


  end
  
end
