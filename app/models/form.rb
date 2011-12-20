class Form < ActiveRecord::Base
  
  STATUS_NOTANSWER = 'NOT ANSWER'
  STATUS_DONE  = 'DONE'
  STATUS_MAILTO = 'SENT TO EMAIL'
  
  
 class << self
      def status_collection
       {
        "NOT ANSWER" => STATUS_NOTANSWER,
        "SENT TO EMAIL" => STATUS_MAILTO,
        "DONE" => STATUS_DONE,
       }
      end
   end
    def status_tag
        case self.status
          when STATUS_NOTANSWER then :error
          when STATUS_MAILTO then :warning
          when STATUS_DONE then :ok
        end
    end
end
