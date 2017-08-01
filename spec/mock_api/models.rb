class Model
  class << self
    def count
      @count ||= 0
    end
    attr_writer :count

    def all
      @all ||= []
    end

    def [] id
      all[id-1]
    end
  end

  def initialize hash
    @hash = hash
  end

  def valid?
    @hash.all? { |_,v| not v.empty? }
  end

  def save
    @hash['id'] = self.class.count; self.class.count += 1
    self.class.all << self
    self
  end

  def columns
  end

  def errors
    { "some errors": "have happened" }
  end

  def update hash
    id = hash['id'] = @hash['id']
    self.class.all[id] = hash
  end

  def to_json
    @hash.to_json
  end
end

class User < Model
  def columns
    [:id, :name, :email, :company_id]
  end
end

class Company < Model
  def columns
    [:id, :name, :quota]
  end
end
