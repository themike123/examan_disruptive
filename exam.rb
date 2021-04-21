class User
	attr_accessor :id
    attr_accessor :username
    attr_accessor :parent_id

    def initialize(username, id)
        self.id = id
        self.username = username
        self.parent_id = nil
    end

end

class UnilevelTree
	@users = []
	@tree = nil

    def self.init_tree
      main = User.new('main',0)
      
      @users << main
    	(1..12).each do |i|
        @users << User.new("user#{i}",i)        
      end
      
      @tree = main
      
    end

    #TODO
    def self.load_users        

        parent = 0
        ciclo = 0

        for i in 0..@users.length-1
                        
            if ciclo == 3
                ciclo = 0
                parent = parent + 1
            end

            if i != 0
                @users[i].parent_id = @users[parent].id
                ciclo = ciclo + 1
            end
               
        end

    end

    #TODO
    def self.same_line?(user_id_a, user_id_b)
        return true
    end

end

UnilevelTree.init_tree
UnilevelTree.load_users
puts UnilevelTree.same_line?(2,9)
