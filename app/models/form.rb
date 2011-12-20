class Form < ActiveRecord::Base
  
  STATUS_NOTANSWER = 'NOT_ANSWER'
  STATUS_DONE  = 'DONE'
  STATUS_MAILTO = 'SENT_TO_EMAIL'
  
  
 class << self
      def status_collection
       {
        "NOT_ANSWER" => STATUS_NOTANSWER,
        "DONE" => STATUS_DONE,
       }
      end
   end
    def status_tag
        case self.status
          when STATUS_NOTANSWER then :error
          when STATUS_DONE then :ok
        end
    end
end
