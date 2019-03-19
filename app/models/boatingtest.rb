class BoatingTest

  attr_accessor :student, :test_name, :status, :instructor_name

  @@all = []

  def initialize(student, test_name, status, instructor_name)
    @student = student
    @test_name = test_name
    @status = 'pending'
    @instructor_name = instructor_name

    @@all << self
  end

  def self.all
    @@all
  end

end
