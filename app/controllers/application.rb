require 'net/http'

class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  helper :all
  protect_from_forgery

  class CicindelaIf
    @@host = 'localhost'
    @@service = 'bookmark'

    def self.get(item, max)
      path = '/cicindela/recommend?set=' + @@service + '&op=for_item&item_id=' + item.to_s
      begin
        res = Net::HTTP::get(@@host, path)
      rescue
        return []
      end
      unless /^(\d+\s+)+$/ =~ res
        return []
      end
      ary = res.split(/\s+/).map{|w| w.to_i}
      ary.slice(0 .. max-1)
    end

    def self.set(user, item)
      path = '/cicindela/record?set=' + @@service + '&op=insert_pick&user_id=' + user.to_s + '&item_id=' + item.to_s
      res = Net::HTTP::get(@@host, path)
    end

    def self.del(user, item)
      path = '/cicindela/record?set=' + @@service + '&op=delete_pick&user_id=' + user.to_s + '&item_id=' + item.to_s
      res = Net::HTTP::get(@@host, path)
    end
  end

end
