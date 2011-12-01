class Form < ActiveRecord::Base
  
  STATUS_NOTANSWER = 'NOT ANSWER'
  STATUS_DONE  = 'DONE'
  STATUS_SENTTOEMAIL = 'SENT TO EMAIL'

 class << self
      def status_collection
       {
        "NOT ANSWER" => STATUS_NOTANSWER,
        "FOR COLLECTION" => STATUS_SENTTOEMAIL,
        "DONE" => STATUS_DONE,
       }
      end
   end
    def status_tag
        case self.status
          when STATUS_NOTANSWER then :error
          when STATUS_COLLECTION then :warning
          when STATUS_DONE then :ok
        end
    end
end
