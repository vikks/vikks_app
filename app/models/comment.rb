class Comment < ActiveRecord::Base
  
    belongs_to :post,    :counter_cache => true
  
    validates_presence_of :author, :author_email, :content, :status
    validates_length_of :author, :within => 3..25
    validates_inclusion_of :status, :in => %w{ new approved spam }
    validates_format_of :author_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
 
    #This is an example for validation callbacks
    def before_validation
        #strips the white spaces from author and author_email
         self.author.strip!
         self.author_email.strip!
   end
   
   
   
   private #-------------------------------
   #The  validate method is used for custom validations.
   #Note that it must be a private method.
   def validate
      # errors .add(:author, " can't be Vikas" ) if self.author == "Vikas"
      # errors .add_to_base( " Vikas can't be the author" ) if self.author == "Vikas"
   end
end